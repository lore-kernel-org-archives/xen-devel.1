From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [PATCH] sched/credit: avoid priority boost for
 capped domains when unpark
Date: Fri, 3 May 2019 12:56:30 -0600
Message-ID: <CB078283-0837-4477-A831-564745FD0C76@xenproject.org>
References: <20190503153839.19932-1-elnikety@amazon.com>
 <9434ed49fc68a05999e130abfde973663ed41d2d.camel@suse.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SF20=TD=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hMdMM-00037N-2i
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 18:56:38 +0000
Received: by mail-ua1-x944.google.com with SMTP id g16so2387481uad.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 11:56:36 -0700 (PDT)
In-Reply-To: <9434ed49fc68a05999e130abfde973663ed41d2d.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Lars Kurth <lars.kurth@xen.org>, Eslam Elnikety <elnikety@amazon.com>
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIDMgTWF5IDIwMTksIGF0IDEwOjQ4LCBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1
c2UuY29tPiB3cm90ZToKPiAKPiBPbiBGcmksIDIwMTktMDUtMDMgYXQgMTU6MzggKzAwMDAsIEVz
bGFtIEVsbmlrZXR5IHdyb3RlOgo+PiBXaGVuIHVucGF1c2luZyBhIGNhcHBlZCBkb21haW4sIHRo
ZSBzY2hlZHVsZXIgY3VycmVudGx5IGNsZWFycyB0aGUKPj4gQ1NDSEVEX0ZMQUdfVkNQVV9QQVJL
RUQgZmxhZyBiZWZvcmUgdmNwdV93YWtlKCkuIFRoaXMsIGluIHR1cm4sCj4+IGNhdXNlcyB0aGUK
Pj4gdmNwdV93YWtlIHRvIHNldCBDU0NIRURfUFJJX1RTX0JPT1NULCByZXN1bHRpbmcgaW4gYW4g
dW5mYWlyIGNyZWRpdAo+PiBib29zdC4gVGhlCj4+IGNvbW1lbnQgYXJvdW5kIHRoZSBjaGFuZ2Vk
IGxpbmVzIGFscmVhZHkgc3RhdGVzIHRoYXQgY2xlYXJpbmcgdGhlCj4+IGZsYWcgc2hvdWxkCj4+
IGhhcHBlbiBBRlRFUiB0aGUgdW5wYXVzZS4gVGhpcyBidWcgd2FzIGludHJvZHVjZWQgaW4gY29t
bWl0Cj4+IGJlNjUwNzUwOTQ1Cj4+ICJjcmVkaXQxOiBVc2UgYXRvbWljIGJpdCBvcGVyYXRpb25z
IGZvciB0aGUgZmxhZ3Mgc3RydWN0dXJlIi4KPj4gCj4+IE9yaWdpbmFsIHBhdGNoIGF1dGhvciBj
cmVkaXQ6IFhpIFhpb25nLgo+PiAKPiBNbW0uLi4gSSdtIG5vdCBhbiBleHBlcnQgb2YgdGhlc2Ug
dGhpbmdzLCBidXQgZG9lc24ndCB0aGlzIG1lYW5zIHdlCj4gbmVlZCBhICJTaWduZWQtb2ZmLWJ5
OiBYaSBYaW9uZyA8eHh4QHl5eS56eno+IiB0aGVuPyBDYy1pbmcgTGFycy4uLgoKQXMgZmFyIGFz
IEkgY2FuIHRlbGwgZnJvbSBhIHF1aWNrIHNlYXJjaCBvbiB4ZW4tZGV2ZWxAIFhpIFhpb25nIGlz
IG9yIAp3YXMgYW4gQW1hem9uIGVtcGxveWVlIHNvIGEgc2lnbmVkLW9mZi1ieSBpcyBub3Qgc3Ry
aWN0bHkgbmVjZXNzYXJ5CmJ1dCB5b3UgbWF5IHdhbnQgdG8gc2F5IHNvbWV0aGluZyBsaWtlLgoK
T3JpZ2luYWwgcGF0Y2ggYXV0aG9yIGNyZWRpdDogWGkgWGlvbmcgb2YgQW1hem9uCgpMYXJzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
