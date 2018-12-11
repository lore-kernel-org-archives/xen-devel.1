From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/hvm: Disallow moving the APIC MMIO
 window
Date: Tue, 11 Dec 2018 07:55:57 -0700
Message-ID: <5C0FCFFD02000078002051DD@prv1-mh.provo.novell.com>
References: <1544442313-20394-1-git-send-email-andrew.cooper3@citrix.com>
 <1544461466-32130-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1544461466-32130-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjEyLjE4IGF0IDE4OjA0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gU2VlIHRoZSBjb2RlIGNvbW1lbnQgZm9yIGEgZnVsbCBkaXNjdXNzaW9uLCBidXQgaW4g
c2hvcnQ6IGd1ZXN0cyB3aGljaAo+IGN1cnJlbnRseSBydW4gdW5kZXIgWGVuIGRvbid0IG1vdmUg
dGhlIHdpbmRvdywgYmVjYXVzZSBtb3ZpbmcgaXQgaGFzIG5ldmVyCj4gd29ya2VkIHByb3Blcmx5
LiAgSW1wbGVtZW50aW5nIHN1cHBvcnQgZm9yIG1vdmluZyB0aGUgd2luZG93IGlzIG5ldmVyIGdv
aW5nIHRvCj4gd29yayBhcmNoaXRlY3R1cmFsbHkgdW5sZXNzIHdlIHN3aXRjaCB0byBwZXItdmNw
dSBQMk1zICh3aGljaCBzZWVtcyB2ZXJ5Cj4gdW5saWtlbHkpLCBhbmQgd291bGQgc3RpbGwgYmUg
YSBzdWJzdGFudGlhbCBxdWFudGl0eSBvZiB3b3JrIGZvciBhIGZlYXR1cmUKPiB3aGljaCBpcyB1
bnVzZWQgaW4gcHJhY3RpY2UuCj4gCj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gcmVuYW1lIHZs
YXBpY19tc3Jfc2V0KCkgdG8gYmUgY29uc2lzdGVudCB3aXRoIHRoZQo+IG90aGVyIE1TUiBoYW5k
bGluZyBmdW5jdGlvbnMsIGFuZCByZXR1cm4gWDg2RU1VTF8qIGNvbnN0YW50cy4gIEFkZCBsb2dp
YyB0bwo+IGNoZWNrIGZvciByZXNlcnZlZCBiaXRzLCBpbmNsdWRpbmcgcmVmdXNpbmcgeDJBUElD
IG1vZGUgaWYgaXQgaGFzIG5vdCBiZWVuCj4gb2ZmZXJlZCB0byB0aGUgZ3Vlc3QuICBNb3ZlIHRo
ZSBndWVzdF97cmQsd3J9bXNyX3gyYXBpYygpIGRlY2xhcmF0aW9ucyBpbnRvCj4gdmxhcGljLmgg
d2hpY2ggaXMgYSBtb3JlIGFwcHJvcHJpYXRlIHBsYWNlIGZvciB0aGVtIHRvIGxpdmUuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
