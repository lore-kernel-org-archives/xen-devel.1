From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] xen: introduce a cpumask with all bits
 set
Date: Thu, 14 Mar 2019 09:33:08 -0600
Message-ID: <5C8A7434020000780021EC59@prv1-mh.provo.novell.com>
References: <20190314095953.11752-1-jgross@suse.com>
 <20190314095953.11752-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U6t1=RR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4SM6-0002Pc-Gs
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 15:33:14 +0000
In-Reply-To: <20190314095953.11752-2-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE5IGF0IDEwOjU5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAtLS0g
YS94ZW4vYXJjaC94ODYvaW9fYXBpYy5jCj4gKysrIGIveGVuL2FyY2gveDg2L2lvX2FwaWMuYwo+
IEBAIC0xODgxLDcgKzE4ODEsNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgY2hlY2tfdGltZXIodm9p
ZCkKPiAgICAgIGludCBhcGljMSwgcGluMSwgYXBpYzIsIHBpbjI7Cj4gICAgICBpbnQgdmVjdG9y
LCByZXQ7Cj4gICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+IC0gICAgY3B1bWFza190IG1hc2tf
YWxsOwo+ICAKPiAgICAgIGxvY2FsX2lycV9zYXZlKGZsYWdzKTsKPiAgCj4gQEAgLTE4OTIsOCAr
MTg5MSw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBjaGVja190aW1lcih2b2lkKQo+ICAgICAgdmVj
dG9yID0gSVJRMF9WRUNUT1I7Cj4gICAgICBjbGVhcl9pcnFfdmVjdG9yKDApOwo+ICAKPiAtICAg
IGNwdW1hc2tfc2V0YWxsKCZtYXNrX2FsbCk7Cj4gLSAgICBpZiAoKHJldCA9IGJpbmRfaXJxX3Zl
Y3RvcigwLCB2ZWN0b3IsICZtYXNrX2FsbCkpKQo+ICsgICAgaWYgKChyZXQgPSBiaW5kX2lycV92
ZWN0b3IoMCwgdmVjdG9yLCAmY3B1bWFza19hbGwpKSkKPiAgICAgICAgICBwcmludGsoS0VSTl9F
UlIiLi5JUlEwIGlzIG5vdCBzZXQgY29ycmVjdGx5IHdpdGggaW9hcGljISEhLCBlcnI6JWRcbiIs
IHJldCk7CgpJIGFjdHVhbGx5IHF1ZXN0aW9uIHRoaXMgdXNlOiBjaGVja190aW1lcigpIGdldHMg
Y2FsbGVkIGJlZm9yZQphbnkgQVBzIGdldCBvbmxpbmVkLCBzbyBjcHVtYXNrX29mKDApIHNob3Vs
ZCBiZSBlcXVhbGx5IGZpbmUKaGVyZS4gQnV0IHRoZSB1c2VzIGluIHRoZSBzY2hlZHVsZXIgcGVy
aGFwcyBzdGlsbCB3YXJyYW50IHRoZQpuZXcgb2JqZWN0LCBhbmQgdGhlIGNvZGUgaGVyZSBjYW4g
YXMgd2VsbCBiZSBjbGVhbmVkIHVwIGxhdGVyLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
