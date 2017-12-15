From: Chao Gao <chao.gao@intel.com>
Subject: Re: [RFC Patch v4 2/8] ioreq: bump the number of IOREQ
 page to 4 pages
Date: Fri, 15 Dec 2017 08:35:42 +0800
Message-ID: <20171215003541.GA21543@op-computing>
References: <5cf06a5713b0402b8ad1d1a69a7d77f0@AMSPEX02CL03.citrite.net>
 <f1f66b3af868410d87e0f6dad4a57116@AMSPEX02CL03.citrite.net>
 <20171207065629.GA49036@op-computing>
 <646776360aa2466eabd8fb9bdcccd8dc@AMSPEX02CL03.citrite.net>
 <20171212010337.GA6727@op-computing>
 <29f1803cb91f44fc86d6832ea44a4f27@AMSPEX02CL03.citrite.net>
 <20171212233918.GA36363@op-computing>
 <b5e1ec23f3b7412d984f0c9aa5ec888e@AMSPEX02CL03.citrite.net>
 <b4c030d86cf54a53b5cad54d1041d988@AMSPEX02CL03.citrite.net>
 <d254a2681480497cb6ed9688c2c4c0b2@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <d254a2681480497cb6ed9688c2c4c0b2@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMTQsIDIwMTcgYXQgMDI6NTA6MTdQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+PiA+Cj4+ID4gSG1tLiBUaGF0IGxv
b2tzIGxpa2UgaXQgaXMgYmVjYXVzZSB0aGUgaW9yZXEgc2VydmVyIHBhZ2VzIGFyZSBub3Qgb3du
ZWQgYnkKPj4gPiB0aGUgY29ycmVjdCBkb21haW4uIFRoZSBYZW4gcGF0Y2ggc2VyaWVzIHVuZGVy
d2VudCBzb21lIGNoYW5nZXMgbGF0ZXIgaW4KPj4gPiByZXZpZXcgYW5kIEkgZGlkIG5vdCByZS10
ZXN0IG15IFFFTVUgcGF0Y2ggYWZ0ZXIgdGhhdCBzbyBJIHdvbmRlciBpZgo+PiA+IG1hcHBpbmcg
SU9SRVEgcGFnZXMgaGFzIHNpbXBseSBiZWNvbWUgYnJva2VuLiBJJ2xsIGludmVzdGlnYXRlLgo+
PiA+Cj4+IAo+PiBJIGhhdmUgcmVwcm9kdWNlZCB0aGUgcHJvYmxlbSBsb2NhbGx5IG5vdy4gV2ls
bCB0cnkgdG8gZmlndXJlIG91dCB0aGUgYnVnCj4+IHRvbW9ycm93Lgo+PiAKPgo+Q2hhbywKPgo+
ICBDYW4geW91IHRyeSBteSBuZXcgYnJhbmNoIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2Vi
Lz9wPXBlb3BsZS9wYXVsZHUveGVuLmdpdDthPXNob3J0bG9nO2g9cmVmcy9oZWFkcy9pb3JlcTI0
Pwo+Cj4gIFRoZSBwcm9ibGVtIHdhcyBpbmRlZWQgdGhhdCB0aGUgaW9yZXEgcGFnZXMgd2VyZSBv
d25lZCBieSB0aGUgZW11bGF0aW5nIGRvbWFpbiByYXRoZXIgdGhhbiB0aGUgdGFyZ2V0IGRvbWFp
biwgd2hpY2ggaXMgbm8gbG9uZ2VyIGNvbXBhdGlibGUgd2l0aCBwcml2Y21kJ3MgdXNlIG9mIEhZ
UEVSVklTT1JfbW11X3VwZGF0ZS4KCk9mIGNvdXJzZS4gSSB0ZXN0ZWQgdGhpcyBicmFuY2guIEl0
IHdvcmtzIHdlbGwuCgpCdXQsIEkgdGhpbmsgeW91ciBwcml2Y21kIHBhdGNoIGNvdWxkbid0IHNl
dCAnZXJyX3B0cicgdG8gTlVMTCB3aGVuCmNhbGxpbmcgeGVuX3JlbWFwX2RvbWFpbl9tZm5fYXJy
YXkoKS4gSXQgd29ya3MgZm9yIHRoZSBpb3JlcSBwYWdlIGlzCmFsbG9jYXRlZCByaWdodCBiZWZv
cmUgdGhlIGJ1ZmlvcmVxIHBhZ2UsIGFuZCB0aGVuIHRoZXkgaGFwcGVuIHRvIGJlCmNvbnRpbnVv
dXMuCgpUaGFua3MKQ2hhbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
