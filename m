From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] x86emul: slightly alter AVX512
 exception checking conditionals
Date: Mon, 10 Dec 2018 07:14:21 -0700
Message-ID: <5C0E74BD0200007800204B1B@prv1-mh.provo.novell.com>
References: <5C0A55780200007800204012@prv1-mh.provo.novell.com>
 <5C0A5701020000780020401F@prv1-mh.provo.novell.com>
 <b74c858b-f758-5621-2d56-9f63d0f05fed@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gWMKK-00076U-IP
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 14:14:28 +0000
In-Reply-To: <b74c858b-f758-5621-2d56-9f63d0f05fed@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjEyLjE4IGF0IDE1OjAwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDcvMTIvMjAxOCAxMToxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFdoaWxlIGFj
dHVhbGx5IGJlbmlnbiAob3BlcmFuZHMgYXJlIGVpdGhlciByZWdpc3RlciBvciBtZW1vcnkgb25l
cwo+PiBhbnl3YXkpLCBJIHRoaW5rIGl0IGlzIGJldHRlciB0byB1c2UgIT0gaW5zdGVhZCBvZiA9
PSBmb3Igc3VjaCBjaGVja3MuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiAKPiBJIGRvbid0IHNlZSB0aGUgcG9pbnQgb2YgbWFraW5nIHRoaXMg
Y2hhbmdlLiAgQ29kZSBpcyBlYXNpZXIgdG8gZm9sbG93Cj4gd2hlbiB0aGVyZSBhcmUgZmV3ZXIg
bmVnYXRpb25zLgoKSXMgIT0gYSBuZWdhdGlvbj8gSSBhc2sgYmVjYXVzZSBpbiBnZW5lcmFsIEkg
YWdyZWUgd2l0aCB0aGF0IHBvc2l0aW9uCm9mIHlvdXJzLiBUaGUgaWRlYSBoZXJlIGlzIHRoYXQg
YmVzaWRlcyBPUF9SRUcgYW5kIE9QX01FTSB3ZQphbHNvIGhhdmUgT1BfSU1NIGFuZCBPUF9OT05F
LiBCeSBjYXJlZnVsbHkgdXNpbmcgIT0gYW5kID09IEknbQp0cnlpbmcgdG8gbWFrZSBzdXJlIChh
bmQgbm90IHRoZSBsZWFzdCBkb2N1bWVudCkgdGhhdCAoaW4gdGhlIGNhc2VzCmhlcmUpIHdlIGRv
bid0IGxldCB0aGluZ3MgZ28gdGhyb3VnaCBpbiBjYXNlIHRoZSB2YWx1ZSAobWlzdGFrZW5seSkK
aXMgb25lIG9mIHRoZSAiaW1wb3NzaWJsZSIgKGluIHRoZXNlIGNvbnRleHRzKSB0d28uCgo+IEJ1
dCB3aGF0ZXZlciAtIEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgoKVGhhbmtzLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
