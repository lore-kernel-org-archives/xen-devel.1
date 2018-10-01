From: Julien Grall <julien.grall@arm.com>
Subject: Re: [[PATCH v3] 4/4] xen/arm: Replace call_smc with
 arm_smccc_smc
Date: Mon, 1 Oct 2018 14:13:25 +0100
Message-ID: <9e0160ad-853c-6efa-1a04-15f801ef06da@arm.com>
References: <20181001124639.22885-1-julien.grall@arm.com>
 <20181001124639.22885-5-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181001124639.22885-5-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: sstabellini@kernel.org, volodymyr_babchuk@epam.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMC8wMS8yMDE4IDAxOjQ2IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gICBQTEFU
Rk9STV9TVEFSVChzZWF0dGxlLCAiU0VBVFRMRSIpCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9wc2NpLmMgYi94ZW4vYXJjaC9hcm0vcHNjaS5jCj4gaW5kZXggOTQxZWVjOTIxYi4uNGFlNjUw
NGYzZSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vcHNjaS5jCj4gKysrIGIveGVuL2FyY2gv
YXJtL3BzY2kuYwo+IEBAIC00Miw0MiArNDIsNTMgQEAgdWludDMyX3Qgc21jY2NfdmVyOwo+ICAg
Cj4gICBzdGF0aWMgdWludDMyX3QgcHNjaV9jcHVfb25fbnI7Cj4gICAKPiArI2RlZmluZSBQU0NJ
X1JFVChyZXMpICAgKChpbnQzMl90KShyZXMpLmEwKQo+ICsKPiAgIGludCBjYWxsX3BzY2lfY3B1
X29uKGludCBjcHUpCj4gICB7Cj4gLSAgICByZXR1cm4gY2FsbF9zbWMocHNjaV9jcHVfb25fbnIs
IGNwdV9sb2dpY2FsX21hcChjcHUpLCBfX3BhKGluaXRfc2Vjb25kYXJ5KSwgMCk7Cj4gKyAgICBz
dHJ1Y3QgYXJtX3NtY2NjX3JlcyByZXM7Cj4gKwo+ICsgICAgYXJtX3NtY2NjX3NtYyhwc2NpX2Nw
dV9vbl9uciwgY3B1X2xvZ2ljYWxfbWFwKGNwdSksIF9fcGEoaW5pdF9zZWNvbmRhcnkpLAo+ICsg
ICAgICAgICAgICAgICAgICAmcmVzKTsKPiArCj4gKyAgICByZXR1cm4gUFNDSV9SRVQocmVzLmEw
KTsKCkhtbW0gdGhpcyBzaG91bGQgaGF2ZSBiZWVuIFBTQ0lfUkVUKHJlcykuIEkgZ3Vlc3MgdGhp
cyBjb3VsZCBiZSBmaXhlZCBpZiAKbm90IG90aGVyIGNoYW5nZS4KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
