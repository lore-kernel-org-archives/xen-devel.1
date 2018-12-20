From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V11 4/5] p2m: Always use hostp2m when
 clipping rangesets
Date: Thu, 20 Dec 2018 08:01:30 -0700
Message-ID: <5C1BAECA02000078002081B2@prv1-mh.provo.novell.com>
References: <1544001488-23763-1-git-send-email-rcojocaru@bitdefender.com>
 <1544001488-23763-5-git-send-email-rcojocaru@bitdefender.com>
 <5C07FD4302000078002033AF@prv1-mh.provo.novell.com>
 <5e22ea77-26f9-be55-c30f-8a598cd35218@bitdefender.com>
 <5C1237EF0200007800205C8F@prv1-mh.provo.novell.com>
 <f3da63c2-ec2d-e7fb-468b-3faf8cf9c67b@citrix.com>
 <5C1B50D60200007800207E4D@prv1-mh.provo.novell.com>
 <efa718ea-8fdc-0803-704f-5628c3b3a10e@citrix.com>
 <5C1B9E8402000078002080F4@prv1-mh.provo.novell.com>
 <49204ce7-bb5f-2aad-a2b8-a2219db89260@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gZzpQ-0005v3-50
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 15:01:36 +0000
In-Reply-To: <49204ce7-bb5f-2aad-a2b8-a2219db89260@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjEyLjE4IGF0IDE1OjM4LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBBdCB0aGUgbW9tZW50IEknbSBvbmx5IHdvcmtpbmcgNC1pc2ggbW9yZSBkYXlzIGJldHdl
ZW4gbm93IGFuZCB0aGUgY29kZQo+IGZyZWV6ZSwgYW5kIHdlJ3JlIGFyZ3Vpbmcgb3ZlciB3aGV0
aGVyIHRoZSBjb21tZW50IHNob3VsZCBzYXksICJXZQo+IHNob3VsZCBwcm9iYWJseSBkbyBYIGlu
c3RlYWQiIG9yICJXZSBzaG91bGQgcHJvYmFibHkgZG8gWSBpbnN0ZWFkLiIKPiAKPiBDYW4gd2Ug
anVzdCBmb3Igbm93IHRha2UgdGhlIHRleHQgYXMgSSBwcm9wb3NlZCBpdD8gIFlvdSBjYW4gYXJn
dWUgYWJvdXQKPiB0aGUgcmlnaHQgdGhpbmcgdG8gZG8gd2hlbiB3ZSBkbyB0aGUgYWxsZWdlZCBj
bGVhbi11cC4KCk9oLCBhbmQgYnR3IC0gd2hpbGUgSSBzZWUgd2hlcmUgeW91J3JlIGNvbWluZyBm
cm9tLCBJIGRvbid0IGxpa2UKdGFraW5nIGFuIGFwcHJvYWNoaW5nIGNvZGUgZnJlZXplIGFzIGFu
IGV4Y3VzZSB0byBzaG9ydCBjaXJjdWl0CmFueXRoaW5nLCBuZWl0aGVyIHJldmlld3Mgbm9yIGRp
c2N1c3Npb25zLiBJbiB0aGUgZW5kIGl0J3MgYQpjb21tZW50IG9ubHkgaGVyZSwgYnV0IHRoZSBv
dmVyYWxsIHNpdHVhdGlvbiBpcyAoYXBwYXJlbnRseSkKdW5jbGVhciBlbm91Z2ggdGhhdCBhIG5l
dyBtaXNsZWFkaW5nIGNvbW1lbnQgaXMgbm90IGdvaW5nIHRvCmhlbHAgYXQgYWxsLCB0aGUgbW9y
ZSB0aGF0IHdlIGFsbCBrbm93IGhvdyBpbnRlbmRlZCBjbGVhbnVwcwpvZnRlbiB3b3JrIG91dCBv
bmNlIHRoZSBtYWluIHJvYWRibG9jayBpcyBvdXQgb2YgdGhlIHdheS4KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
