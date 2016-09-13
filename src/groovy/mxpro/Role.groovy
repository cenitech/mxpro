package mxpro


enum Role {
	ROLE_USER,
	ROLE_ADMIN
	
	public String getAuthority() {
		return this.name();
	}
}
