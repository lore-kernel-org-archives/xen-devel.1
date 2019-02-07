From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] x86/shadow: adjust minimum allocation
 calculations
Date: Thu, 7 Feb 2019 13:29:56 +0100
Message-ID: <4c98d36b-5b63-d32a-d89b-8c0b72631315@suse.com>
References: <5C5ABD7102000078002143B1@suse.com>
 <5C5C196C020000780021495E@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tb4s=QO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1grioc-0006LW-Q6
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 12:30:02 +0000
In-Reply-To: <5C5C196C020000780021495E@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDIvMjAxOSAxMjo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQSBwcmV2aW91c2x5IGJh
ZCBzaXR1YXRpb24gaGFzIGJlY29tZSB3b3JzZSB3aXRoIHRoZSBlYXJseSBzZXR0aW5nIG9mCj4g
LT5tYXhfdmNwdXM6IFRoZSB2YWx1ZSByZXR1cm5lZCBieSBzaGFkb3dfbWluX2FjY2VwdGFibGVf
cGFnZXMoKSBoYXMKPiBmdXJ0aGVyIGdyb3duLCBhbmQgaGVuY2Ugbm93IGhvbGRzIGJhY2sgZXZl
biBtb3JlIG1lbW9yeSBmcm9tIHVzZSBmb3IKPiB0aGUgcDJtLgo+IAo+IE1ha2Ugc2hfbWluX2Fs
bG9jYXRpb24oKSBhY2NvdW50IGZvciBhbGwgcDJtIG1lbW9yeSBuZWVkZWQgZm9yCj4gc2hhZG93
X2VuYWJsZSgpIHRvIHN1Y2NlZWQgZHVyaW5nIGRvbWFpbiBjcmVhdGlvbiAoYXQgd2hpY2ggcG9p
bnQgdGhlCj4gZG9tYWluIGhhcyBubyBtZW1vcnkgYXQgYWxsIGFsbG9jYXRlZCB0byBpdCB5ZXQs
IGFuZCBoZW5jZSB1c2Ugb2YKPiBkLT50b3RfcGFnZXMgaXMgbWVhbmluZ2xlc3MpLgo+IAo+IEFs
c28gbWFrZSBzaGFkb3dfbWluX2FjY2VwdGFibGVfcGFnZXMoKSBubyBsb25nZXIgbmVlZGxlc3Ns
eSBhZGQgMSB0bwo+IHRoZSB2Q1BVIGNvdW50Lgo+IAo+IEZpbmFsbHkgbWFrZSB0aGUgZGVidWdn
aW5nIHByaW50aygpIGluIHNoYWRvd19hbGxvY19wMm1fcGFnZSgpIGEgbGl0dGxlCj4gbW9yZSB1
c2VmdWwgYnkgbG9nZ2luZyBzb21lIG9mIHRoZSByZWxldmFudCBkb21haW4gc2V0dGluZ3MuCj4g
Cj4gUmVwb3J0ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+
IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBSZXZpZXdl
ZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpSZWxlYXNlLWFj
a2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
