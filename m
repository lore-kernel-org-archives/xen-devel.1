From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/3] xen/xsm: remove unnecessary #define
Date: Tue, 09 Oct 2018 03:02:40 -0600
Message-ID: <5BBC6EB002000078001EFDF6@prv1-mh.provo.novell.com>
References: <20181009002831.22678-1-xin.li@citrix.com>
 <5BBC51B402000078001EFD3C@prv1-mh.provo.novell.com>
 <56ab33751a224203bd79c4ee09b77b03@SINPEX02CL01.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <56ab33751a224203bd79c4ee09b77b03@SINPEX02CL01.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xin Li <xin.li@citrix.com>, Xin Li <talons.lee@gmail.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, xen-devel@lists.xen.org, Ming Lu <ming.lu@citrix.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjEwLjE4IGF0IDA5OjUwLCA8eGluLmxpQGNpdHJpeC5jb20+IHdyb3RlOgo+PiA+
IC0tLQo+PiA+IENDOiBEYW5pZWwgRGUgR3JhYWYgPGRnZGVncmFAdHljaG8ubnNhLmdvdj4KPj4g
PiBDQzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgo+PiA+IEND
OiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4+ID4gQ0M6IEtvbnJhZCBSemVzenV0
ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPj4gPiBDQzogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+PiA+IENDOiBUaW0gRGVlZ2FuIDx0aW1AeGVu
Lm9yZz4KPj4gPiBDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPj4gPiBDQzogU2Vy
Z2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgo+PiA+IENDOiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+PiA+IENDOiBNaW5nIEx1IDxtaW5nLmx1
QGNpdHJpeC5jb20+Cj4+ID4KPj4gPiB2NToKPj4gPiAxLiBtb3ZlIHRoZSByZW1vdmFsIG9mICNk
ZWZpbmUgdG8gdGhpcyBuZXcgcGF0Y2guCj4+ID4gMi4gZml4IHdyb25nIGdpdCBhdXRob3IKPj4g
Cj4+IE9oLCBhbmQgcGxlYXNlLCB3aGVuIHlvdSBzZW5kIG5ldyB2ZXJzaW9ucywgYWRkIHByZXZp
b3VzbHkgcHJvdmlkZWQgKG9mCj4+IGNvdXJzZSB1bmxlc3MgdGhleSd2ZSBiZWVuIGludmFsaWRh
dGVkIG1lYW53aGlsZSkgdGFncywgdG8gYWlkIGJvdGggCj4gY29tbWl0dGVycwo+PiBhbmQgZnV0
dXJlIHJlYWRlcnMvcmV2aWV3ZXJzLgo+PiAKPiBEbyB5b3UgbWVhbiBhbGwgdGhlIGNoYW5nZXMg
ZnJvbSB2MSB0byB2NSwgbGlrZToKPiAKPiB2MToKPiB4eHgKPiAKPiB2MjoKPiB4eHgKPiAuLgo+
IAo+IHY1CgpObywgdGhpcyBpcyBvY2Nhc2lvbmFsbHkgaGVscGZ1bCwgYnV0IG5vdCB3aGF0IEkg
bWVhbi4gSSBnYXZlIG15IFItYgpvbiB2NCwgc28geW91IHNob3VsZCBoYXZlIHJlY29yZGVkIGl0
IGluIHY1LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
