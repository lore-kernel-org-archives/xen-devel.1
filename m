From: Juergen Gross <jgross@suse.com>
Subject: Re: Linux 5.0 regression: BUG: unable to handle kernel
 paging request at ffff888023e26778 RIP: e030:move_page_tables+0x7c1/0xae0
Date: Sat, 9 Feb 2019 19:48:24 +0100
Message-ID: <094e923b-4e64-57d8-42c4-6e8890473035__14999.359513034$1549738166$gmane$org@suse.com>
References: <39ae9195-cf8f-01fe-df83-38a9a4c52e48@eikelenboom.it>
 <da8badb7-9743-020e-6891-dac944b61ee9@eikelenboom.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z1eq=QQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gsXg1-0007Vc-1q
 for xen-devel@lists.xenproject.org; Sat, 09 Feb 2019 18:48:33 +0000
In-Reply-To: <da8badb7-9743-020e-6891-dac944b61ee9@eikelenboom.it>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sander Eikelenboom <linux@eikelenboom.it>, Linus Torvalds <torvalds@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "Joel Fernandes (Google)" <joel@joelfernandes.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDIvMjAxOSAxOTo0NSwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+IE9uIDA5LzAy
LzIwMTkgMDk6MjYsIFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToKPj4gTC5TLiwKPj4KPj4KPj4g
V2hpbGUgdGVzdGluZyBhIExpbnV4IDUuMC1yYzUtaXNoIGtlcm5lbCAocHVsbCBvZiB5ZXN0ZXJk
YXkpIHdpdGggc29tZSBhZGRpdGlvbmFsIHBhdGNoZXMgZm9yCj4+IGFscmVhZHkgcmVwb3J0ZWQg
b3RoZXIgaXNzdWVzIGkgY2FtZSBhY3Jvc3MgdGhlIGlzc3VlIGJlbG93IHdoaWNoIGkgaGF2ZW4n
dCBzZWVuIHdpdGggNC4yMC54Cj4+Cj4+IEkgaGF2ZW4ndCBnb3QgYSByZXByb2R1Y2VyIHNvIGkg
bWlnaHQgYmUgaGFyZCB0byBoaXQgaXQgYWdhaW4sIAo+PiBzeXN0ZW0gaXMgQU1EIGFuZCB0aGlz
IGlzIGZyb20gdGhlIGhvc3Qga2VybmVsIHJ1bm5pbmcgdW5kZXIKPj4gdGhlIFhlbiBoeXBlcnZp
c29yIG1pZ2h0IGl0IG1hdHRlci4KPiAKPj4gLS0KPj4KPj4gU2FuZGVyCj4gCj4gSGkgQm9yaXMg
LyBKdWVyZ2VuLAo+IAo+IFRoZSBjb21taXQgY2F1c2luZyB0aGlzIGlzOgo+IDJjOTFiZDRhNGUy
ZTUzMDU4MmQ2ZmQ2NDNlYTdiODZiMjc5MDcxNTEgbW06IHNwZWVkIHVwIG1yZW1hcCBieSAyMHgg
b24gbGFyZ2UgcmVnaW9ucwo+IAo+IFNpbmNlIGl0IHNlZW1zIHRoZXJlIGhhdmVuJ3QgYmVlbiBh
bnkgb3RoZXIgcmVwb3J0cyBhYm91dCB0aGlzIC4uIAo+IGNvdWxkIGl0IGJlIHRoaXMgZG9lc24n
dCBzcGVjaWZpY2FsbHkgd29yayB3ZWxsIHdpdGggYSBYZW4gUFZIIGRvbTAgPwoKUFZIPyBOb3Qg
UFY/CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
