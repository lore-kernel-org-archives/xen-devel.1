From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/alt: Fix build when CONFIG_LIVEPATCH is
 disabled
Date: Wed, 29 Aug 2018 06:00:48 -0600
Message-ID: <5B868AF002000078001E2FE4@prv1-mh.provo.novell.com>
References: <1535540222-11439-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1535540222-11439-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA4LjE4IGF0IDEyOjU3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gYy9zIGIyOGNkMjFjMzYyOCAieDg2L2J1aWxkOiBVc2UgbmV3IC5ub3BzIGRpcmVjdGl2
ZSB3aGVuIGF2YWlsYWJsZSIKPiBpbnRyb2R1Y2VkIGEgX19yZWFkX21vc3RseSBib29sZWFuIHdo
aWNoIGlzIGluY2x1ZGVkIGlmIHRoZSB0b29sY2hhaW4gc3VwcG9ydHMKPiB0aGUgLm5vcHMgZGly
ZWN0aXZlLgo+IAo+IFdoZW4gQ09ORklHX0xJVkVQQVRDSCBpcyBjb21waWxlZCBvdXQsIGFsdGVy
bmF0aXZlLm8gaXMgZXhwZWN0ZWQgdG8gYmUgYSBmdWxseQo+IGluaXQgbW9kdWxlLCBhbmQgdG9v
bGNoYWluX25vcHNfYXJlX2lkZWFsIHRyaXBzIHRoZSBidWlsZCBzeXN0ZW0gY2hlY2s6Cj4gCj4g
ICBFcnJvcjogc2l6ZSBvZiBhbHRlcm5hdGl2ZS5vOi5kYXRhLnJlYWRfbW9zdGx5IGlzIDB4MDEK
PiAgIC9sb2NhbC94ZW4uZ2l0L3hlbi9SdWxlcy5tazoyMDY6IHJlY2lwZSBmb3IgdGFyZ2V0ICdh
bHRlcm5hdGl2ZS5pbml0Lm8nIGZhaWxlZAo+ICAgbWFrZVszXTogKioqIFthbHRlcm5hdGl2ZS5p
bml0Lm9dIEVycm9yIDEyCj4gCj4gSW50cm9kdWNlIGluaXRfb3JfbGl2ZXBhdGNoX3JlYWRfbW9z
dGx5IGFuZCBzd2l0Y2ggdGhlIGFubm90YXRpb24gZm9yCj4gdG9vbGNoYWluX25vcHNfYXJlX2lk
ZWFsLgo+IAo+IFJlcG9ydGVkLWJ5OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+Cj4gU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJl
dmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgooSSd2ZSBqdXN0IHJ1
biBpbnRvIHRoaXMgYXMgd2VsbC4pCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
