From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 09/18] xen: remove unnecessary code from
 dataplane/xen-block.c
Date: Fri, 7 Dec 2018 16:20:19 +0000
Message-ID: <20181207162019.GA29831__26148.3298884288$1544199558$gmane$org@perard.uk.xensource.com>
References: <1544108924-10841-1-git-send-email-paul.durrant@citrix.com>
 <1544108924-10841-10-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zRRO=OQ=citrix.com=prvs=87219212e=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gVIrd-0005jA-Jq
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 16:20:29 +0000
Content-Disposition: inline
In-Reply-To: <1544108924-10841-10-git-send-email-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMDYsIDIwMTggYXQgMDM6MDg6MzVQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IHYyOgo+ICAtIExlYXZlIGV4aXN0aW5nIGJvaWxlcnBsYXRlIGFsb25lLCBvdGhlciB0
aGFuIHJlbW92aW5nIHRoZSBub3ctaW5jb3JyZWN0Cj4gICAgZGVzY3JpcHRpb24KPiAtLS0KPiAg
aHcvYmxvY2svZGF0YXBsYW5lL3hlbi1ibG9jay5jIHwgNDA5ICsrLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCsp
LCAzOTMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2h3L2Jsb2NrL2RhdGFwbGFuZS94
ZW4tYmxvY2suYyBiL2h3L2Jsb2NrL2RhdGFwbGFuZS94ZW4tYmxvY2suYwo+IGluZGV4IDlmYWU1
MDUuLjk4Zjk4N2QgMTAwNjQ0Cj4gLS0tIGEvaHcvYmxvY2svZGF0YXBsYW5lL3hlbi1ibG9jay5j
Cj4gKysrIGIvaHcvYmxvY2svZGF0YXBsYW5lL3hlbi1ibG9jay5jCj4gQEAgLTEsNiArMSw0IEBA
Cj4gIC8qCj4gLSAqICB4ZW4gcGFyYXZpcnQgYmxvY2sgZGV2aWNlIGJhY2tlbmQKPiAtICoKPiAg
ICogIChjKSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiAgICoKPiAgICogIFRo
aXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQv
b3IgbW9kaWZ5Cj4gQEAgLTE5LDI2ICsxNywxMiBAQAo+ICAgKiAgR05VIEdQTCwgdmVyc2lvbiAy
IG9yIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCj4gICAqLwo+ICAKPiArLyoK
PiArICogQ29weXJpZ2h0IChjKSAyMDE4ICBDaXRyaXggU3lzdGVtcyBJbmMuCgpZb3UgY2FuIGFk
ZCB0aGlzIGNvcHlyaWdodCBsaW5lIGp1c3QgYWZ0ZXIgR2VyZCdzIG9uZSBhYnJvdmUuCgo+ICsg
Kgo+ICsgKiBUaGlzIHdvcmsgaXMgbGljZW5zZWQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUg
R1BMLCB2ZXJzaW9uIDIgb3IgbGF0ZXIuCj4gKyAqIFNlZSB0aGUgQ09QWUlORyBmaWxlIGluIHRo
ZSB0b3AtbGV2ZWwgZGlyZWN0b3J5LgoKQW5kIEknbSBwcmV0dHkgc3VyZSB0aGlzIHNob3VsZCBu
b3QgYmUgYWRkZWQuIFRoZSBib2lsZXJwbGF0ZSBhdCB0aGUgdG9wCm9mIHRoZSBmaWxlIGFscmVh
ZHkgc3RhdGUgdGhhdCB5b3VyIGNvbnRyaWJ1dGlvbnMgaXMgZ29pbmcgdG8gYmUgR1BMdjIrLgoK
LS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
