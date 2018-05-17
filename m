From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 06/10] x86/SVM: Add vcpu scheduling
 support for AVIC
Date: Thu, 17 May 2018 08:45:11 -0600
Message-ID: <5AFD957702000078001C3AAC@prv1-mh.provo.novell.com>
References: <20180507210753.2280-1-Janakarajan.Natarajan@amd.com>
 <20180507210753.2280-7-Janakarajan.Natarajan@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180507210753.2280-7-Janakarajan.Natarajan@amd.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA1LjE4IGF0IDIzOjA3LCA8SmFuYWthcmFqYW4uTmF0YXJhamFuQGFtZC5jb20+
IHdyb3RlOgo+IEBAIC02NSw2ICs2Niw1MSBAQCBhdmljX2dldF9waHlzaWNhbF9pZF9lbnRyeShz
dHJ1Y3Qgc3ZtX2RvbWFpbiAqZCwgdW5zaWduZWQgaW50IGluZGV4KQo+ICAgICAgcmV0dXJuICZk
LT5hdmljX3BoeXNpY2FsX2lkX3RhYmxlW2luZGV4XTsKPiAgfQo+ICAKPiArc3RhdGljIHZvaWQg
YXZpY192Y3B1X2xvYWQoc3RydWN0IHZjcHUgKnYpCj4gK3sKPiArICAgIHN0cnVjdCBhcmNoX3N2
bV9zdHJ1Y3QgKnMgPSAmdi0+YXJjaC5odm1fc3ZtOwo+ICsgICAgaW50IGhfcGh5X2FwaWNfaWQ7
CgpBUElDIElEcyBhcmUgb2YgdW5zaWduZWQgdHlwZS4KCj4gKyAgICBBU1NFUlQoIXRlc3RfYml0
KF9WUEZfYmxvY2tlZCwgJnYtPnBhdXNlX2ZsYWdzKSk7Cj4gKwo+ICsgICAgLyoKPiArICAgICAq
IE5vdGU6IEFQSUMgSUQgPSAweGZmIGlzIHVzZWQgZm9yIGJyb2FkY2FzdC4KPiArICAgICAqICAg
ICAgIEFQSUMgSUQgPiAweGZmIGlzIHJlc2VydmVkLgo+ICsgICAgICovCj4gKyAgICBoX3BoeV9h
cGljX2lkID0gY3B1X2RhdGFbdi0+cHJvY2Vzc29yXS5hcGljaWQ7Cj4gKyAgICBBU1NFUlQoaF9w
aHlfYXBpY19pZCA8IEFWSUNfUEhZX0FQSUNfSURfTUFYKTsKPiArCj4gKyAgICBzLT5hdmljX2xh
c3RfcGh5X2lkLT5ob3N0X3BoeV9hcGljX2lkID0gaF9waHlfYXBpY19pZDsKPiArICAgIHNtcF93
bWIoKTsKPiArICAgIHNldF9iaXQoSVNfUlVOTklOR19CSVQsICh1NjQqKShzLT5hdmljX2xhc3Rf
cGh5X2lkKSk7CgpZb3UgaGF2ZSBhIHN0cnVjdCBkZWZpbmVkIGZvciB0aGlzIC0gcGxlYXNlIGF2
b2lkIHN1Y2ggYm9ndXMgY2FzdGluZy4KSSBjYW4gc2VlIHdoeSB5b3UgbWF5IG5vdCB3YW50IHRv
IHVzZSB0aGUgYml0ZmllbGQgaGVyZSAtIG1ha2UgdGhlCnN0cnVjdCBhIHVuaW9uIHdpdGggYSAi
cmF3IiBmaWVsZCwgZGVmaW5lIElTX1JVTk5JTkdfQklUIHJpZ2h0IHRoZXJlIChzbwpvbmUgY2Fu
IGVhc2lseSBzZWUgdGhlIGNvcnJlbGF0aW9uOyBtYXkgcmVxdWlyZSByZW5hbWluZyB0aGUgY29u
c3RhbnQpLAphbmQgZG8gdGhlIG9wZXJhdGlvbiBvbiAmcy0+cmF3LgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
