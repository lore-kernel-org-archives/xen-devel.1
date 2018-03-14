From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH] xenbaked.c: Avoid divide by zero issue on
	dump_stats()
Date: Wed, 14 Mar 2018 10:54:42 +0000
Message-ID: <CAFLBxZYME-PKN3HfUa8-Go0teLnWd9ep1fMAGTkYMwT6SxqnNw@mail.gmail.com>
References: <560fcc42-d01f-f60d-0c9f-4373d4e8e8f4@oracle.com>
 <20180314022426.GQ3543@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=zknl=ge=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1ew43R-00070x-I7
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 10:54:45 +0000
Received: by mail-qt0-x22b.google.com with SMTP id n12so2880636qtl.5
 for <xen-devel@lists.xenproject.org>; Wed, 14 Mar 2018 03:54:43 -0700 (PDT)
In-Reply-To: <20180314022426.GQ3543@char.us.oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Philip Lee <philip.lee@oracle.com>, Joe Jin <joe.jin@oracle.com>, Wei Liu <wei.liu2@citrix.com>, Ian Campbell <ian.campbell@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMTQsIDIwMTggYXQgMjoyNCBBTSwgS29ucmFkIFJ6ZXN6dXRlayBXaWxrCjxr
b25yYWQud2lsa0BvcmFjbGUuY29tPiB3cm90ZToKPiBPbiBUdWUsIE1hciAxMywgMjAxOCBhdCAw
NjozODoyNFBNIC0wNzAwLCBKb2UgSmluIHdyb3RlOgo+PiBydW5fdGltZSBvbiBkdW1wX3N0YXRz
KCkgbWF5YmUgemVybyBpZiBicmVhayB4ZW5tb24ucHkgaW1tZWRpYXRlbHkgYWZ0ZXIgaXQKPgo+
IHMvbWF5YmUvY2FuIGJlLwo+PiBzdGFydGVkLCB0aGVuIHhlbmJha2VkIGhpdCBkaXZpZGUgYnkg
emVybyBmYXVsdC4KPgo+IEFuZDoKPgo+ICJOb3RlIHRoYXQgcnVuX3RpbWUgaXMgY29tcHV0ZWQg
dXNpbmcgdHdvIHZhbHVlcyB3aGljaCBhcmUgcmV0cmlldmVkIHVzaW5nICd0aW1lJwo+IHN5c3Rl
bSBjYWxsIHdoaWNoIGdpdmVzIHVzIHJlc29sdXRpb24gaW4gc2Vjb25kcy4iCgpJcyBhbnlvbmUg
c3RpbGwgdXNpbmcgdGhpcz8gIERvZXMgaXQgZXZlbiB3b3JrPyAgSSB0aG91Z2h0IHdlIGhhZAp0
YWxrZWQgYWJvdXQgcmVtb3ZpbmcgaXQgYXQgc29tZSBwb2ludC4KCiAtR2VvcmdlCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
