## Users テーブル
| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| nickname  | string | null: false |
| greeting  | text   |             |
| email     | string | null: false |
| password  | string | null: false |

### Association
- has_many :house_users
- has_many :houses, through: :house_users
- has_many :roles
- has_many :tags
- has_many :check_points



## Houses テーブル
| Column       | Type    | Options     |
| ------------ | ------- | ------------|
| name         | string  | null: false |
| introduction | text    |             |
| owner_id     | integer | null: false |

### Association
- has_many :house_users
- has_many :users, through: :house_users
- has_many :roles
- has_many :tags



## House_users テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| house_id  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :house



## Roles テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| content  | text       | null: false                    |
| house_id | references | null: false, foreign_key: true | 
| user_id  | references | null: false, foreign_key: true |  
| position | string     |                                |

### Association
- belongs_to :house
- belongs_to :user
- has_many :tags
- has_many :check_points



## Tags テーブル
| Column   | Type       | Options                        |
| ---------| ---------- | ------------------------------ |
| name     | string     | null: false                    |
| house_id | references | null: false, foreign_key: true |
| user_id  | references | null: false, foreign_key: true |  

### Association
- belongs_to :house
- belongs_to :user
- has_many :role_tags
- has_many :roles, through: :role_tags



## Role_tags テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| role_id | references | null: false, foreign_key: true |
| tag_id  | references | null: false, foreign_key: true |

### Association
- belongs_to :role
- belongs_to :tag



## check_points テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| content     | text       | null: false                    |
| role_id     | references | null: false, foreign_key: true |
| user_id     | references | null: false, foreign_key: true | 
| position    | string     |                                |

### Association
- belongs_to :role
- belongs_to :user












- has_many :role_tags
- has_many :tags, through: :role_tags








## Tags テーブル

| Column | Type   | Options     |
| -------| ------ | ----------- |
| name   | string | null: false |

### Association
- belongs_to :house
- has_many :role_tags
- has_many :roles, through: :role_tags
