From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Mon, 25 Feb 2019 05:10:14 -0700
Message-ID: <5C73DB260200007800219CF1@prv1-mh.provo.novell.com>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
 <a30ca582-0993-9652-112e-467f49605405@arm.com>
 <f3438c56-1e7c-88fa-fb0e-b770eccf6d88@gmail.com>
 <bbc8f1bc-c8dd-6784-fbe4-0667127d37af@arm.com>
 <63101f28-a1ad-bffd-158a-c7e1380f6e18@gmail.com>
 <547c3711-02a3-9071-5bb1-494ca45eb4a6@arm.com>
 <alpine.DEB.2.10.1902221253050.30151@sstabellini-ThinkPad-X260>
 <a946a3c9-af1d-2a95-ba52-1cb01ecdcb1e@arm.com>
 <e690b1e9-29e4-452b-a4fb-f796fba5f1b0@gmail.com>
 <9c562301-c486-2919-c986-7761843e2ba2@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gyF7M-0007MM-5o
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 12:12:20 +0000
In-Reply-To: <9c562301-c486-2919-c986-7761843e2ba2@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, oleksandr_andrushchenko@epam.com, Oleksandr Andrushchenko <andr2000@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjAyLjE5IGF0IDEyOjQ3LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEZvciBlbnVtLCBhIGNvbXBpbGVyIHN1cHBvcnRpbmcgLVdzd2l0Y2ggY2FuIGhlbHBzIHVzIHRv
IGNhdGNoIHdoZW4gd2UgZm9yZ290IHRvIAo+IGhhbmRsZSBhIGVsZW1lbnQgb2YgdGhlIGVudW0u
IFRoZSBkZWZhdWx0IGNhc2UgZGVmZWF0cyAtV3N3aXRjaC4gWWV0IGhhdmluZyBhIAo+IGRlZmF1
bHQgY291bGQgcHJvdGVjdCB1cyBhZ2FpbnN0IGNvZGUgZXJyb3IuIEl0IGxvb2tzIGxpa2UgdGhh
dCBHQ0MgaGF2ZSBhbiAKPiBvcHRpb24gLVdzd2l0Y2gtZW51bSB0aGF0IGNvdWxkIGhlbHAgdXMu
IFRoZSBvcHRpb24gd2lsbCBzaW1pbGFyIHRvIC1Xc3dpdGNoIAo+IGV4Y2VwdCBpdCB3aWxsIHdh
cm4gZXZlbiB3aGVuIHRoZXJlIGFyZSBhIGRlZmF1bHQgY2FzZS4gSSBhbSBjdXJpb3VzIHRvIHNl
ZSBpZiAKPiB3ZSBjYW4gdXNlIGl0IHJlbGlhYmx5IGluIFhlbi4KCkkgY2FuIHNheSBhbHJlYWR5
IG5vdyB0aGF0IEknbSBhZ2FpbnN0IHRoZSB1c2Ugb2YgLVdzd2l0Y2gtZW51bS4gSXQKZGVmZWF0
cyB0aGUgbWFpbiBpZGVhIG9mICJkZWZhdWx0OiIgaW4gQy4gVGhlIGxvbmdlciB0aGUgbGlzdCBv
ZgplbnVtZXJhdG9ycyBpbiBhbiBlbnVtLCB0aGUgd29yc2UgdGhlIHNpdHVhdGlvbiBiZWNvbWVz
IHdoZW4geW91Cm1lYW4gdG8gaGFuZGxlIHNwZWNpYWxseSBhIGNvdXBsZSBvZiBjYXNlcyB3aGls
ZSBkb3plbnMgb2Ygb3RoZXJzCnVzZSBhIGNvbW1vbiBwYXRoLCBhbGwgb2Ygd2hpY2ggd291bGQg
dGhlbiBuZWVkIHRvIGdldCBlbmxpc3RlZC4KeDg2J3MgcDJtX2dldF9pb21tdV9mbGFncygpIGFu
ZCBodm1lbXVsX3JlcF9zdG9zKCkgbWF5IGdpdmUgeW91CmEgdmFndWUgaW1wcmVzc2lvbiBvZiB3
aGF0IEkgbWVhbi4uLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
