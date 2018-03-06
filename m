From: John Naggets <hostingnuggets@gmail.com>
Subject: Re: [Xen-users] Only one CPU available to Xen? (nr_cpus
	: 1)
Date: Tue, 6 Mar 2018 12:50:04 +0100
Message-ID: <CAPTZE3tQf=WukhTi1=5jdLSbeXHz5SPuBTab5k+1pn6Q8PWHuw@mail.gmail.com>
References: <CAPTZE3smJ_i=AvrK13zgEq-2hOM0urDDwhhrqiMGi24pMCxEZg@mail.gmail.com>
 <CAFLBxZbwT88x8+SBniXU3fsbgOhuncs_456952Krb8Z3XKXHug@mail.gmail.com>
 <CAPTZE3uMyVpuYXwUHXTPbVz_3DpExePc8fo__KsG53zBAX+xCA@mail.gmail.com>
 <CAFLBxZZZpTPBgZziZZjovE6jSO_3BkckMm4DKMqkfDBL2B-8bQ@mail.gmail.com>
 <70f4cf6f-0216-48e1-db2b-57c02325dcc4@citrix.com>
 <CAPTZE3ub-nAq7G46puNcDG+SK97db+b-mQR42nh-EBXaFTW4nw@mail.gmail.com>
 <5A9E7DDD02000078001AEEA2@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=cqrn=f4=gmail.com=hostingnuggets@srs-us1.protection.inumbo.net>)
 id 1etB6c-0002LY-Cx
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 11:50:06 +0000
Received: by mail-it0-x234.google.com with SMTP id e64so14406943ita.5
 for <xen-devel@lists.xenproject.org>; Tue, 06 Mar 2018 03:50:05 -0800 (PST)
In-Reply-To: <5A9E7DDD02000078001AEEA2@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, George Dunlap <dunlapg@umich.edu>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgNiwgMjAxOCBhdCAxMTozOSBBTSwgSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKCj4gQXMgaW5kaWNhdGVkIGluIGFub3RoZXIgcmVwbHksIHRyeSB1c2lu
ZyBHclVCJ3MgImNoYWlubG9hZGVyIgo+IGRpcmVjdGl2ZSBvciBib290IHhlbi5lZmkgZGlyZWN0
bHkgZnJvbSB0aGUgRUZJIHNoZWxsIG9yIHRoZSBFRkkKPiBib290IGxvYWRlci4KClNvcnJ5IGZv
ciBteSBuYWl2ZSBxdWVzdGlvbiBidXQgaG93IGRvIEkgY2hhaW5sb2FkIFhlbiB3aXRoIEdSVUI/
IEkKZGlkIG5vdCBmaW5kIGFueSBkb2N1bWVudGF0aW9uIGFib3V0IHRoYXQgb24gdGhlIFhlbiB3
aWtpLiBJIHRoaW5rIGl0CndvdWxkIGJlIHVzZWZ1bCBmb3Igb3RoZXIgWGVuIHVzZXJzIHRvbyB0
byBoYXZlIHRoaXMgZG9jdW1lbnRlZCBhcyBpbgp0aGUgZnV0dXJlIG1hbnkgcGVvcGxlIHdpbGwg
YmUgYWZmZWN0ZWQgYnkgdGhpcyBwcm9ibGVtIGR1ZSB0byB0aGUKZmFjdCB0aGF0IG1vcmUgYW5k
IG1vcmUgc2VydmVycyB3aWxsIGRlcHJlY2F0ZSBsZWdhY3kgYm9vdCBtb2RlIHN1Y2gKYXMgaW4g
bXkgY2FzZS4KClJlZ2FyZGluZyB0aGUgc2Vjb25kIG1ldGhvZCBvZiBoYXZpbmcgVUVGSSBsb2Fk
aW5nIGRpcmVjdGx5IHRoZSBYZW4KRUZJLCBJIHRyaWVkIHRoaXMgb3V0IHllc3RlcmRheSB1c2lu
ZyB0aGUgaW5zdHJ1Y3Rpb25zIG9uIHRoZSBYZW4gd2lraQooaHR0cHM6Ly93aWtpLnhlbnByb2pl
Y3Qub3JnL3dpa2kvWGVuX0VGSSNYZW5fYXNfRUZJX2JpbmFyeV8uMjhsb2FkaW5nLjI5KQpidXQg
SSBnZXQgdGhlIGZvbGxvd2luZyBlcnJvciBtZXNzYWdlIHJpZ2h0IHdoZW4gc3RhcnRpbmcgdG8g
bG9hZCB0aGUKWGVuIDQuOS4wIEVGSSBsb2FkZXI6CgpSZWFkIGZhaWxlZCBmb3IgaW5pdHJkLmlt
Zy00LjEzLjAtMzYtZ2VuZXJpYzogRXJyQ29kZTogMHg4MDAwMDAwMDAwMDAwMDA0CgpBbnkgaWRl
YXMgd2hhdCBjb3VsZCBiZSBnb2luZyB3cm9uZyBoZXJlPwoKSm9obgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
