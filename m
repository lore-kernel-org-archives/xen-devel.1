From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] page-alloc: accompany BUG() with printk()
Date: Wed, 15 May 2019 10:59:20 +0100
Message-ID: <fb2114ce-79d0-fcb1-5b4e-c540aecb360b@citrix.com>
References: <5CDBD157020000780022F1EA@prv1-mh.provo.novell.com>
 <20190515094435.fgcqzbmj7gbqfgmj@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rumq=TP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hQqh8-00035q-5i
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 09:59:30 +0000
In-Reply-To: <20190515094435.fgcqzbmj7gbqfgmj@Air-de-Roger>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDUvMjAxOSAxMDo0NCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIE1h
eSAxNSwgMjAxOSBhdCAwMjo0NDowN0FNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gTG9n
IGluZm9ybWF0aW9uIGxpa2VseSByZWxldmFudCBmb3IgdW5kZXJzdGFuZGluZyB3aHkgdGhlIEJV
RygpcyB3ZXJlCj4gV2h5IG5vdCB1c2UgcGFuaWMgaW5zdGVhZCBvZiBwcmludGsgKyBCVUc/CgpC
ZWNhdXNlIHRoZSBiYWNrdHJhY2UgaXMgdXNlZnVsIGEgbG90IG9mIHRoZSB0aW1lLgoKfkFuZHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
