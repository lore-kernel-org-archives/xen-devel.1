From: Julien Grall <julien.grall@arm.com>
Subject: Re: Xen project CI systems and committer workflow
Date: Thu, 25 Apr 2019 13:53:51 +0100
Message-ID: <8b2130fd-dd48-fcdc-4f8b-0e1f6f698808@arm.com>
References: <20190418123159.GD30543@zion.uk.xensource.com>
 <5b7cd86e-e664-d5f1-9262-f7671dc3395a@citrix.com>
 <23736.33638.713410.602994@mariner.uk.xensource.com>
 <5CC1A9FD02000078002290A8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nzHz=S3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJdsy-0003TG-E4
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 12:53:56 +0000
In-Reply-To: <5CC1A9FD02000078002290A8@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, committers@xenproject.org, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMjUvMDQvMjAxOSAxMzozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MTguMDQuMTkgYXQgMTY6MDIsIDxpYW4uamFja3NvbkBjaXRyaXguY29tPiB3cm90ZToKPj4gQW5k
cmV3IENvb3BlciB3cml0ZXMgKCJSZTogWGVuIHByb2plY3QgQ0kgc3lzdGVtcyBhbmQgY29tbWl0
dGVyIHdvcmtmbG93Iik6Cj4+PiBXaGlsZSBldmVyeXRoaW5nIHByZXNlbnRlZCBoZXJlIGlzIGZp
bmUgdG8gZG8gYXMgYSBtYXR0ZXIgb2YgcG9saWN5LCB0aGUKPj4+IGNvbW1pdHRlcnMgc3RpbGwg
bmVlZCB0byByZXRhaW4gdGhlIGFiaWxpdHkgdG8gYWN0dWFsbHkgcHVzaCBkaXJlY3RseSB0bwo+
Pj4gdGhlIHN0YWdpbmcgYnJhbmNoZXMgb24geGVuLmdpdAo+Pgo+PiBXaHkgPwo+Pgo+PiBJbiBw
YXJ0aWN1bGFyLCB0aGlzIHNlZW1zIHRvIHByZXN1cHBvc2UgdGhhdCB0aGVzZSAic3RhZ2luZyIg
YnJhbmNoZXMKPj4gY29udGludWUgdG8gZXhpc3QuCj4+Cj4+IE9uZSBvZiBvdXIgc3RyYW5nZSBw
cmFjdGljZXMgaXMgdGhhdCB3ZSBwdXNoIHRoaW5ncyB0byBhIG5vbi1yZXdpbmRpbmcKPj4gYnJh
bmNoIGJlZm9yZSB0aGV5IGhhdmUgYmVlbiB0ZXN0ZWQuICBOb3csIE9LLCB3ZSBoYXZlIGJlZW4g
ZG9pbmcgdGhhdAo+PiBmb3Igb3ZlciBhIGRlY2FkZSAtIHNpbmNlIGJlZm9yZSBwZW9wbGUgcmVh
bGx5IGludmVudGVkIHRoZSBtb2Rlcm4KPj4gY29uY2VwdCBvZiAiQ0kiIC0gYnV0IHRoYXQgZG9l
c24ndCBtYWtlIGl0IHNlbnNpYmxlLgo+IAo+IE5vdyB0aGUgcXVlc3Rpb24gb2YgY291cnNlIGlz
IC0gd2h5IGRvIHlvdSBjb25zaWRlciB0aGlzIHByYWN0aWNlCj4gInN0cmFuZ2UiPyBBbmQgd2hh
dCBkbyB5b3UgbWVhbiBieSAiYmVmb3JlIHRoZXkgaGF2ZSBiZWVuCj4gdGVzdGVkIj8gQW55IHN1
Ym1pdHRlciBzaG91bGQgaGF2ZSB0ZXN0ZWQgdGhlaXIgcGF0Y2hlcy4gWWVzLCBub3QKPiBldmVy
eW9uZSB0ZXN0cyBhbGwgcG9zc2libGUgKGJhc2ljKSBjb25maWd1cmF0aW9ucywgYnV0IHdlIHNw
b3QKPiBzdWNoIGlzc3VlcyBpbiByZXZpZXcgbW9yZSBvZnRlbiB0aGFuIHRoZXkgc2xpcCB0aHJv
dWdoLCBJIHRoaW5rLgoKSXQgaXMgZmFpcmx5IGNvbW1vbiB0byBzZWUgYnJlYWthZ2Ugb24gQXJt
IGJlY2F1c2UgY2hhbmdlcyB3YXMgb25seSBjb21waWxlZCBvbiAKeDg2LiBUaGUgbW9zdCBjb21t
b24gYXJndW1lbnQgaXMgIkkgZG9uJ3QgaGF2ZSBzZXR1cCB0byBidWlsZCBBcm0iLgoKVGhlIENJ
IHdvdWxkIGFsbG93IHVzIHRvIHRlc3Qgb24gZXZlcnkgYXJjaCwgZGlmZmVyZW50IHZhcmlhdGlv
biBvZiAuY29uZmlnIChhbmQgCnBvc3NpYmx5IGNvbXBpbGVyKS4KCj4gQW5kIEkgZG9uJ3QgZXhw
ZWN0IENJIHdpbGwgY29tZSBhbnl3aGVyZSBuZWFyIHRlc3RpbmcgYWxsCj4gX3Bvc3NpYmxlXyBj
b25maWd1cmF0aW9ucywgaS5lLiB0aGUgcmlzayBvZiBzdWJ0bGUgYnJlYWthZ2Ugd29uJ3QKPiBn
ZXQgZWxpbWluYXRlZCBhbHRvZ2V0aGVyIGFueXdheS4KCk5vdGhpbmcgaXMgZnVsbHkgYnVsbGV0
LXByb29mLCBidXQgdGhpcyBpcyBhbiBpbXByb3ZlbWVudCBvdmVyIG1hbnVhbCB0ZXN0aW5nIG9u
IAptb3N0IG9mIHRoZSBidWlsZCBjb25maWd1cmF0aW9uIHRvZGF5LiBUaGUgQ0kgYWN0dWFsbHkg
cHJvdmVkIHRoZSB1c2VmdWxuZXNzIGJ5IApjYXRjaGluZyBidWlsZCBidWcgaW4gcmFuZG9tIC5j
b25maWcgdGhlIGxhc3QgZmV3IG1vbnRocy4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
