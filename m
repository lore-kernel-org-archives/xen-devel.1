From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/4] xen/watchdog: Fold exit paths to have a
 single unlock
Date: Mon, 13 May 2019 08:01:01 -0600
Message-ID: <5CD9789D020000780022E267@prv1-mh.provo.novell.com>
References: <1557512884-32395-1-git-send-email-andrew.cooper3@citrix.com>
 <1557512884-32395-2-git-send-email-andrew.cooper3@citrix.com>
 <5CD97567020000780022E1F0@prv1-mh.provo.novell.com>
 <9d672876-1630-4a10-4b85-e1db7dbefbd4@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQBVr-0006op-1z
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:01:07 +0000
In-Reply-To: <9d672876-1630-4a10-4b85-e1db7dbefbd4@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Pau Ruiz Safont <pau.safont@citrix.com>, Julien Grall <julien.grall@arm.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA1LjE5IGF0IDE1OjUxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMDUvMjAxOSAxNDo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDEw
LjA1LjE5IGF0IDIwOjI4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiAt
LS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUu
Ywo+Pj4gQEAgLTEwNTAsNiArMTA1MCw4IEBAIHN0YXRpYyB2b2lkIGRvbWFpbl93YXRjaGRvZ190
aW1lb3V0KHZvaWQgKmRhdGEpCj4+PiAgCj4+PiAgc3RhdGljIGxvbmcgZG9tYWluX3dhdGNoZG9n
KHN0cnVjdCBkb21haW4gKmQsIHVpbnQzMl90IGlkLCB1aW50MzJfdCB0aW1lb3V0KQo+Pj4gIHsK
Pj4+ICsgICAgbG9uZyByYyA9IDA7Cj4+IEknbSB3b25kZXJpbmcgd2h5IHRoaXMgaXNuJ3QgcGxh
aW4gaW50LiBOb3QgYSBiaWcgZGVhbCwgYnV0IEknbQo+PiBjdXJpb3VzIGFueXdheS4KPiAKPiBU
byBtYXRjaCB0aGUgcmV0dXJuIHZhbHVlLgoKQnV0IHRoZSBjb21waWxlciB3aWxsIGhhcHBpbHkg
c2lnbi1leHRlbmQgdGhlIHZhbHVlIGF0IHRoZSByZXR1cm4gc3RhdGVtZW50LgoKPiAgVGhpcyBm
dW5jdGlvbiBpcyBjb21waWxlZCB0d2ljZSBBRkFJQ1QuCgpJIGhhdmUgbm8gaWRlYSBob3cgdGhp
cyBtYXR0ZXJzLgoKPj4gQXMgcGVyIHlvdXIgb3duIHJlc3BvbnNlIHRvIHBhdGNoIDIgSSB1bmRl
cnN0YW5kIHRoYXQgdGhlCj4+IG90aGVyIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgZG9uI3QgbmVl
ZCBsb29raW5nIGF0IHVudGlsIHlvdQo+PiBzZW5kIGEgdjIuCj4gCj4gcGF0Y2ggMyBpcyBpbmRl
cGVuZGVudCBvZiB0aGUgQUJJIGNoYW5nZXMsIHNvIGZpbmUgaW4gcHJpbmNpcGxlIHRvCj4gcmV2
aWV3IG5vdy4KCk9rYXkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
