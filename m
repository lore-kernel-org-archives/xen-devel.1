From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v14 10/11] x86/hvm: Remove redundant save
 functions
Date: Tue, 31 Jul 2018 08:26:34 -0600
Message-ID: <5B60719A02000078001D986D@prv1-mh.provo.novell.com>
References: <1532520862-13648-1-git-send-email-aisaila@bitdefender.com>
 <1532520862-13648-11-git-send-email-aisaila@bitdefender.com>
 <5B60631002000078001D9769@prv1-mh.provo.novell.com>
 <1533043922.21125.24.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1533043922.21125.24.camel@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjA3LjE4IGF0IDE1OjMyLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IE9uIE1hLCAyMDE4LTA3LTMxIGF0IDA3OjI0IC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4gPiA+ID4gT24gMjUuMDcuMTggYXQgMTQ6MTQsIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4g
d3JvdGU6Cj4+ID4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9ocGV0LmMKPj4gPiArKysgYi94ZW4v
YXJjaC94ODYvaHZtL2hwZXQuYwo+PiA+IEBAIC01MTYsOCArNTE2LDkgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBodm1fbW1pb19vcHMgaHBldF9tbWlvX29wcwo+PiA+ID0gewo+PiA+ICB9Owo+PiA+
ICAKPj4gPiAgCj4+ID4gLXN0YXRpYyBpbnQgaHBldF9zYXZlKHN0cnVjdCBkb21haW4gKmQsIGh2
bV9kb21haW5fY29udGV4dF90ICpoKQo+PiA+ICtzdGF0aWMgaW50IGhwZXRfc2F2ZShzdHJ1Y3Qg
dmNwdSAqdmNwdSwgaHZtX2RvbWFpbl9jb250ZXh0X3QgKmgpCj4+IENvbnNpc3RlbnRseSB2IHBs
ZWFzZS4KPj4gCj4gSGVyZSB0aGUgaHBldF9zYXZlKCkgd29ya3Mgd2l0aCBhIGxvY2FsIGRlZmlu
ZWQgc3RydWN0IHZjcHUqIHYgc28gSQo+IGhhdmUgc3RydWN0IHZjcHUgKnZjcHUgaW4gb3JkZXIg
dG8gY2hhbmdlIGFzIGxpdHRsZSBjb2RlIGFzIHBvc3NpYmxlLgo+IElmIHRoZSB2IG5lZWRzIHRv
IGJlIGNvbnN0YW50IHRoZW4gSSB3aWxsIGNoYW5nZSBpdCBpbiB0aGUgbmV4dAo+IHZlcnNpb24u
IAoKWWVzIHBsZWFzZSwgYnV0IHRoZXJlJ3Mgbm90IGEgd2hvbGUgbG90IHRvIGNoYW5nZTogU2lt
cGx5IGRyb3AgdGhlCmxvY2FsIHZhcmlhYmxlIGRlY2xhcmF0aW9uIG9mIHYgYW5kIG1ha2UgaXRz
IGluaXRpYWxpemVyIGEgbm9ybWFsCnN0YXRlbWVudCAoYXMgdGhlIGZ1bmN0aW9uIGRvZXNuJ3Qg
ZnVydGhlciBjYXJlIGFib3V0IHRoZSBwYXNzZWQKaW4gdikuCgpKYW4KCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
