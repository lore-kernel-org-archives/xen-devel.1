From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/3] xen/xsm: remove unnecessary #define
Date: Tue, 09 Oct 2018 00:59:00 -0600
Message-ID: <5BBC51B402000078001EFD3C@prv1-mh.provo.novell.com>
References: <20181009002831.22678-1-xin.li@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181009002831.22678-1-xin.li@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xin Li <talons.lee@gmail.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xen.org, Xin Li <xin.li@citrix.com>, Ming Lu <ming.lu@citrix.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjEwLjE4IGF0IDAyOjI4LCA8dGFsb25zLmxlZUBnbWFpbC5jb20+IHdyb3RlOgo+
IHRoaXMgI2RlZmluZSBpcyB1bm5lY2Vzc2FyeSBzaW5jZSBYU01fSU5MSU5FIGlzIHJlZGVmaW5l
ZCBpbgo+IHhzbS9kdW1teS5oLCBpdCdzIGEgcmlzayBvZiBidWlsZCBicmVha2FnZSwgc28gcmVt
b3ZlIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFhpbiBMaSA8eGluLmxpQGNpdHJpeC5jb20+Cj4g
Cj4gLS0tCj4gQ0M6IERhbmllbCBEZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292Pgo+IEND
OiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Cj4gQ0M6IEphbiBC
ZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiBDQzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxr
b25yYWQud2lsa0BvcmFjbGUuY29tPgo+IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+Cj4gQ0M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgo+IENDOiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IENDOiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlh
c2xpQGNpdHJpeC5jb20+Cj4gQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Cj4gQ0M6IE1pbmcgTHUgPG1pbmcubHVAY2l0cml4LmNvbT4KPiAKPiB2NToKPiAxLiBt
b3ZlIHRoZSByZW1vdmFsIG9mICNkZWZpbmUgdG8gdGhpcyBuZXcgcGF0Y2guCj4gMi4gZml4IHdy
b25nIGdpdCBhdXRob3IKCk9oLCBhbmQgcGxlYXNlLCB3aGVuIHlvdSBzZW5kIG5ldyB2ZXJzaW9u
cywgYWRkIHByZXZpb3VzbHkKcHJvdmlkZWQgKG9mIGNvdXJzZSB1bmxlc3MgdGhleSd2ZSBiZWVu
IGludmFsaWRhdGVkIG1lYW53aGlsZSkKdGFncywgdG8gYWlkIGJvdGggY29tbWl0dGVycyBhbmQg
ZnV0dXJlIHJlYWRlcnMvcmV2aWV3ZXJzLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
