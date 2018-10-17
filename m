From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] Reservation of PCI device range
 0xc200-0xc2ff to XCP-ng Project
Date: Wed, 17 Oct 2018 17:15:24 +0100
Message-ID: <23495.24604.678245.829164@mariner.uk.xensource.com>
References: <0d7eee26-529d-a900-92d4-9414bfd43eb4@schulzalex.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pqcp=m5=citrix.com=prvs=8215e697b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gCoUF-0007ge-VI
 for xen-devel@lists.xenproject.org; Wed, 17 Oct 2018 16:15:56 +0000
In-Reply-To: <0d7eee26-529d-a900-92d4-9414bfd43eb4@schulzalex.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexander Schulz - XCP-ng Project Member <code@schulzalex.de>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWxleGFuZGVyIFNjaHVseiAtIFhDUC1uZyBQcm9qZWN0IE1lbWJlciB3cml0ZXMgKCJbUEFUQ0hd
IFJlc2VydmF0aW9uIG9mIFBDSSBkZXZpY2UgcmFuZ2UgMHhjMjAwLTB4YzJmZiB0byBYQ1Atbmcg
UHJvamVjdCIpOgo+IFdlIGFyZSB0aGUgWENQLW5nIHByb2plY3QgKGh0dHBzOi8veGNwLW5nLm9y
ZykgYW5kIHdhbnQgdG8gZGlzdHJpYnV0ZSAKPiBvdXIgb3duIFBWLVRvb2xzIChtYXliZSBhbHNv
IHBlciB3aW5kb3dzIHVwZGF0ZXMpIHNvIHdlIG5lZWQgYW4gZXh0cmEgcmFuZ2UuCj4gCj4gV2Ug
YWxzbyByZWdpc3RlcmVkIGEgUENJLURldmljZToKPiAKPiAiWENQLW5nIFByb2plY3QgUENJIERl
dmljZSBmb3IgV2luZG93cyBVcGRhdGUiIC0+IAo+IGh0dHBzOi8vcGNpLWlkcy51Y3cuY3ovcmVh
ZC9QQy81ODUzL2MyMDAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgU2NodWx6IDxjb2Rl
QHNjaHVsemFsZXguZGU+CgpJIHRyaWVkIHRvIGFwcGx5IHRoaXMgYnV0CgpnbWFyaW5lcjp4ZW4u
Z2l0PiBnaXQtYW0gfi9OZXdzL3gKQXBwbHlpbmc6IFJlc2VydmF0aW9uIG9mIFBDSSBkZXZpY2Ug
cmFuZ2UgMHhjMjAwLTB4YzJmZiB0byBYQ1AtbmcgUHJvamVjdAplcnJvcjogY29ycnVwdCBwYXRj
aCBhdCBsaW5lIDEzClBhdGNoIGZhaWxlZCBhdCAwMDAxIFJlc2VydmF0aW9uIG9mIFBDSSBkZXZp
Y2UgcmFuZ2UgMHhjMjAwLTB4YzJmZiB0byBYQ1AtbmcgUHJvamVjdApUaGUgY29weSBvZiB0aGUg
cGF0Y2ggdGhhdCBmYWlsZWQgaXMgZm91bmQgaW46IC5naXQvcmViYXNlLWFwcGx5L3BhdGNoCldo
ZW4geW91IGhhdmUgcmVzb2x2ZWQgdGhpcyBwcm9ibGVtLCBydW4gImdpdCBhbSAtLWNvbnRpbnVl
Ii4KSWYgeW91IHByZWZlciB0byBza2lwIHRoaXMgcGF0Y2gsIHJ1biAiZ2l0IGFtIC0tc2tpcCIg
aW5zdGVhZC4KVG8gcmVzdG9yZSB0aGUgb3JpZ2luYWwgYnJhbmNoIGFuZCBzdG9wIHBhdGNoaW5n
LCBydW4gImdpdCBhbSAtLWFib3J0Ii4KbWFyaW5lcjp4ZW4uZ2l0PgoKVGhhdCdzIG9uIHRoZSBj
b3B5IEkgZ290IHZpYSBteSBjb2xvIGFuZCBpdHMgbWFpbC10by1uZXdzIGdhdGV3YXksIHNvCm5v
dCBtYW5nbGVkIGJ5IHRoZSBDaXRyaXggY29ycG9yYXRlIGVtYWlsIHN5c3RlbS4KCklmIHlvdSBw
cmVmZXIgeW91IGNhbiBwdWJsaXNoIGEgZ2l0IGJyYW5jaC4uLgoKSWFuLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
