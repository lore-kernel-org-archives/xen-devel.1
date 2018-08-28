From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v17 12/13] x86/hvm: Remove redundant save
 functions
Date: Tue, 28 Aug 2018 09:27:01 -0600
Message-ID: <5B8569C502000078001E2AD4@prv1-mh.provo.novell.com>
References: <1534946563-12084-1-git-send-email-aisaila@bitdefender.com>
 <1534946563-12084-13-git-send-email-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1534946563-12084-13-git-send-email-aisaila@bitdefender.com>
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

Pj4+IE9uIDIyLjA4LjE4IGF0IDE2OjAyLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
OgogQEAgLTE0OCw2ICsxNDUsOSBAQCBpbnQgaHZtX3NhdmVfb25lKHN0cnVjdCBkb21haW4gKmQs
IHVuc2lnbmVkIGludCB0eXBlY29kZSwgdW5zaWduZWQgaW50IGluc3RhbmNlLAo+ICAgICAgICAg
ICAhaHZtX3NyX2hhbmRsZXJzW3R5cGVjb2RlXS5zYXZlICkKPiAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPiAgCj4gKyAgICBpZiAoIGh2bV9zcl9oYW5kbGVyc1t0eXBlY29kZV0ua2luZCA9PSBI
Vk1TUl9QRVJfVkNQVSAmJgo+ICsgICAgICAgIGluc3RhbmNlID49IGQtPm1heF92Y3B1cyApCgpJ
bmRlbnRhdGlvbi4KCllvdSdyZSBjaGVja2luZyBpbnN0YW5jZSBvbmx5IGZvciBwZXItdmNwdSBy
ZWNvcmRzLCBidXQgLi4uCgo+IEBAIC0xNTUsNyArMTU1LDcgQEAgaW50IGh2bV9zYXZlX29uZShz
dHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgdHlwZWNvZGUsIHVuc2lnbmVkIGludCBpbnN0
YW5jZSwKPiAgICAgIGlmICggIWN0eHQuZGF0YSApCj4gICAgICAgICAgcmV0dXJuIC1FTk9NRU07
Cj4gIAo+IC0gICAgaWYgKCAocnYgPSBodm1fc3JfaGFuZGxlcnNbdHlwZWNvZGVdLnNhdmUoZCwg
JmN0eHQpKSAhPSAwICkKPiArICAgIGlmICggKHJ2ID0gaHZtX3NyX2hhbmRsZXJzW3R5cGVjb2Rl
XS5zYXZlKGQtPnZjcHVbaW5zdGFuY2VdLCAmY3R4dCkpICE9IDAgKQoKLi4uIHlvdSBfYWdhaW5f
IHVzZSBpdCBhcyBhcnJheSBpbmRleCB1bmNvbmRpdGlvbmFsbHkuIFBsZWFzZQpkb24ndCBzdWJt
aXQgbmV3IHZlcnNpb25zIHdpdGhvdXQgdGFraW5nIGNhcmUgb2YgcmV2aWV3CmNvbW1lbnRzIGdp
dmVuIGZvciBlYXJsaWVyIG9uZXMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
