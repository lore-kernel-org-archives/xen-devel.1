From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] docs/process/xen-release-management: Lesson
 to learn
Date: Fri, 27 Apr 2018 17:02:43 +0100
Message-ID: <be2781a0-24b4-efa6-6793-b97109915e38@arm.com>
References: <1513166547-6002-1-git-send-email-ian.jackson@eu.citrix.com>
 <CAFLBxZY4aOaX-iC0FO+3oeb1QbaRyWfTXnVky3Duw2XeMEB5ng@mail.gmail.com>
 <23267.13438.222034.769494@mariner.uk.xensource.com>
 <b0c9a3dc-b0c7-7d02-16cf-ac18a81041dc@arm.com>
 <23267.17137.157354.733034@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xcxo=hq=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fC5pg-0002q6-Ms
 for xen-devel@lists.xenproject.org; Fri, 27 Apr 2018 16:02:48 +0000
In-Reply-To: <23267.17137.157354.733034@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, George Dunlap <dunlapg@umich.edu>, Lars Kurth <lars.kurth@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSWFuLAoKT24gMjcvMDQvMTggMTY6MzQsIElhbiBKYWNrc29uIHdyb3RlOgo+IEp1bGllbiBH
cmFsbCB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIXSBkb2NzL3Byb2Nlc3MveGVuLXJl
bGVhc2UtbWFuYWdlbWVudDogTGVzc29uIHRvIGxlYXJuIik6Cj4+PiBJIGd1ZXNzIEknbSBiZWlu
ZyBxdWl0ZSBzZWxmaXNoIGhlcmUuICBJJ20gdXN1YWxseSB0aGUgcmVsZWFzZQo+Pj4gdGVjaG5p
Y2lhbi4gIERvaW5nIHJlbGVhc2UgcHJlcGFyYXRpb24gYXQgdGhlIGxhc3QgbWludXRlIGFuZCBp
bgo+Pj4gc3RyYW5nZSB3YXlzIG1lYW5zIGxvdHMgb2Ygb3Bwb3J0dW5pdHkgZm9yIG1lIHRvIG1h
a2UgbWlzdGFrZXMuCj4+Pgo+Pj4gSSB3b3VsZCBsaWtlIHRvIHB1dCBzb21ldGhpbmcgaW4gdGhl
IHJlbGVhc2UgY2hlY2tsaXN0IHRoYXQgc3RvcHMKPj4+IHBlb3BsZSBwdXR0aW5nIG1lIGluIGEg
ZGlmZmljdWx0IHBvc2l0aW9uIHdoZXJlIEkgYW0gKGEpIGxpa2VseSB0bwo+Pj4gbWFrZSBtaXN0
YWtlcyAoYikgdGhvc2UgbWlzdGFrZXMgd2lsbCBiZSBlbWJhcnJhc3NpbmcuCj4+Pgo+Pj4gUHV0
dGluZyB0aGlzIGluIHRoZSByZWxlYXNlIGNoZWNrbGlzdCBkb2Vzbid0IG1lYW4gdGhhdCBpdCBh
bHdheXMgaGFzCj4+PiB0byBiZSBmb2xsb3dlZCwgb2YgY291cnNlLiAgQ2hlY2tsaXN0cyBhcmUg
bm90IHJ1bGVzOyB0aGV5IGFyZQo+Pj4gZ3VpZGVsaW5lcy4KClRoZSB3YXkgZG9jcy9wcm9jZXNz
L3hlbi1yZWxlYXNlLW1hbmFnZW1lbnQgaGFzIGJlZW4gd3JpdHRlbiBnaXZlcyBtb3JlIAphbiBp
bXByZXNzaW9uIG9mIHJ1bGVzL3Byb2Nlc3MgdG8gZm9sbG93IHJhdGhlciB0aGFuIGd1aWRlbGlu
ZXMuIFRoZSAiRG8gCm5vdCBjb21taXQuLi4iIHNlZW1zIHRvIGVuZm9yY2UgaXQuIEl0IG1pZ2h0
IGJlIGdvb2QgdG8gY2xhcmlmeSB0aGF0IAp0aGlzIGlzIGEgZ3VpZGVsaW5lLgoKPj4+Cj4+PiBC
dXQgaWYgdGhpcyBndWlkZWxpbmUgaXMgdmlvbGF0ZWQsIGFuZCBhcyBhIHJlc3VsdCBJIG1lc3Mg
c29tZXRoaW5nIHVwCj4+PiBkdWUgdG8gaGF2aW5nIHRvIGRvIGEgbG90IG9mIGNvbXBsaWNhdGVk
LCBhZC1ob2MsIHVuLXFhLWFibGUsIHdvcmssCj4+PiBhbGwgaW4gYSBodXJyeSwgdGhlbiBpdCB3
b3VsZCBiZSBuaWNlIGlmIGl0IHdlcmUgb2J2aW91cyB0aGF0IHRoZQo+Pj4gY2F1c2Ugb2YgdGhl
IHRyb3VibGUgd2FzIHRoZSBkZWNpc2lvbiB0byB0YWtlIHRoaXMgcmlzaywgcmF0aGVyIHRoYW4K
Pj4+IG15IGNhcmVsZXNzbmVzcyBvciBsYWNrIG9mIGF0dGVudGlvbiB0byBkZXRhaWwuCgpJIHRo
aW5rIHRoYXQgd2FzIG9idmlvdXMgZm9yIG1lIDopLiBCdXQgSSB1bmRlcnN0YW5kIHdlcmUgeW91
IGFyZSBjb21pbmcgCmZyb20gbm93LiBBbmQgeWVzLCBJIGFncmVlIHN1Y2ggZ3VpZGVsaW5lcyB3
b3VsZCBiZSBhIHVzZWZ1bCB0byBoYXZlIGluIAp0aGUgZG9jdW1lbnQuCgpHb2luZyBmb3J3YXJk
LCB3ZSBwcm9iYWJseSB3YW50IHRvIGZpbmQgYSB3YXkgdG8gbWluaW1pemUgcHJvYmxlbSBhcm91
bmQgClhTQXMgY29taW5nIHVwIGJlZm9yZSB0aGUgcmVsZWFzZXMuIFRoaXMgc2VlbXMgdG8gaGFw
cGVuIGF0IGV2ZXJ5IApyZWxlYXNlIG5vd2FkYXlzLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
