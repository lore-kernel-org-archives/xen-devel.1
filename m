From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 09/18] xen: remove unnecessary code from
 dataplane/xen-block.c
Date: Tue, 11 Dec 2018 15:30:21 +0000
Message-ID: <20181211153021.GA16149@perard.uk.xensource.com>
References: <1544525238-3527-1-git-send-email-paul.durrant@citrix.com>
 <1544525238-3527-10-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P5G6=OU=citrix.com=prvs=8761f1f8f=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gWjzU-0002TF-1e
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 15:30:32 +0000
Content-Disposition: inline
In-Reply-To: <1544525238-3527-10-git-send-email-paul.durrant@citrix.com>
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

T24gVHVlLCBEZWMgMTEsIDIwMTggYXQgMTA6NDc6MDlBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
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
PiArICogQ29weXJpZ2h0IChjKSAyMDE4ICBDaXRyaXggU3lzdGVtcyBJbmMuCgpDYW4geW91IG1v
dmUgdGhpcyBjb3B5cmlnaHQgbGluZSB0byB0aGUgZXhpc3RpbmcgbGljZW5zZSBib2lsZXJwbGF0
ZSBhcwpJJ3ZlIGFza2VkIG9uIHYyPwoKPiArICoKPiArICogVGhpcyB3b3JrIGlzIGxpY2Vuc2Vk
IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdQTCwgdmVyc2lvbiAyIG9yIGxhdGVyLgo+ICsg
KiBTZWUgdGhlIENPUFlJTkcgZmlsZSBpbiB0aGUgdG9wLWxldmVsIGRpcmVjdG9yeS4KCkFuZCB0
aGlzIGlzbid0IG5lZWRlZCBhcyBpdCBqdXN0IGR1cGxpY2F0ZSB0aGUgYWxyZWFkeSBleGlzdGlu
ZyBvbmUuCgo+ICsgKi8KPiAgCgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
