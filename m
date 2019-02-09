From: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v2] x86/shadow: adjust minimum allocation
 calculations
Date: Sat, 9 Feb 2019 22:53:56 +0000
Message-ID: <20190209225356.GA65534@deinos.phlegethon.org>
References: <5C5ABD7102000078002143B1@prv1-mh.provo.novell.com>
 <5C5C196C020000780021495E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=b+TT=QQ=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1gsbVd-0003N2-OY
 for xen-devel@lists.xenproject.org; Sat, 09 Feb 2019 22:54:05 +0000
Content-Disposition: inline
In-Reply-To: <5C5C196C020000780021495E@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QXQgMDQ6NDEgLTA3MDAgb24gMDcgRmViICgxNTQ5NTE0NDkyKSwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4gQSBwcmV2aW91c2x5IGJhZCBzaXR1YXRpb24gaGFzIGJlY29tZSB3b3JzZSB3aXRoIHRoZSBl
YXJseSBzZXR0aW5nIG9mCj4gLT5tYXhfdmNwdXM6IFRoZSB2YWx1ZSByZXR1cm5lZCBieSBzaGFk
b3dfbWluX2FjY2VwdGFibGVfcGFnZXMoKSBoYXMKPiBmdXJ0aGVyIGdyb3duLCBhbmQgaGVuY2Ug
bm93IGhvbGRzIGJhY2sgZXZlbiBtb3JlIG1lbW9yeSBmcm9tIHVzZSBmb3IKPiB0aGUgcDJtLgo+
IAo+IE1ha2Ugc2hfbWluX2FsbG9jYXRpb24oKSBhY2NvdW50IGZvciBhbGwgcDJtIG1lbW9yeSBu
ZWVkZWQgZm9yCj4gc2hhZG93X2VuYWJsZSgpIHRvIHN1Y2NlZWQgZHVyaW5nIGRvbWFpbiBjcmVh
dGlvbiAoYXQgd2hpY2ggcG9pbnQgdGhlCj4gZG9tYWluIGhhcyBubyBtZW1vcnkgYXQgYWxsIGFs
bG9jYXRlZCB0byBpdCB5ZXQsIGFuZCBoZW5jZSB1c2Ugb2YKPiBkLT50b3RfcGFnZXMgaXMgbWVh
bmluZ2xlc3MpLgo+IAo+IEFsc28gbWFrZSBzaGFkb3dfbWluX2FjY2VwdGFibGVfcGFnZXMoKSBu
byBsb25nZXIgbmVlZGxlc3NseSBhZGQgMSB0bwo+IHRoZSB2Q1BVIGNvdW50Lgo+IAo+IEZpbmFs
bHkgbWFrZSB0aGUgZGVidWdnaW5nIHByaW50aygpIGluIHNoYWRvd19hbGxvY19wMm1fcGFnZSgp
IGEgbGl0dGxlCj4gbW9yZSB1c2VmdWwgYnkgbG9nZ2luZyBzb21lIG9mIHRoZSByZWxldmFudCBk
b21haW4gc2V0dGluZ3MuCj4gCj4gUmVwb3J0ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+CgpBY2tlZC1ieTogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CgpJIGRvbid0IHRoaW5r
IGl0J3Mgd29ydGggYmlrZXNoZWRkaW5nIHRvbyBoYXJkIG92ZXIgaW5kaXZpZHVhbApwYWdlcyBv
biB0aGlzIHBhdGg7IHRoZXNlIG51bWJlcnMgbG9vayBPSy4KCkNoZWVycywKClRpbS4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
