From: George Dunlap <George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH V2] x86/altp2m: clean up
 p2m_{get/set}_suppress_ve()
Date: Tue, 25 Sep 2018 11:09:03 +0100
Message-ID: <CAFLBxZY3cmgUazVJ_AMvtQ0skcqH0MroWbe_Mz2AaBb+i-Y0Gg@mail.gmail.com>
References: <1537864588-18733-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=8smr=mh=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1g4kHL-0003rP-LC
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 10:09:15 +0000
Received: by mail-qt1-f196.google.com with SMTP id e26-v6so495490qtq.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Sep 2018 03:09:14 -0700 (PDT)
In-Reply-To: <1537864588-18733-1-git-send-email-rcojocaru@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMjUsIDIwMTggYXQgOTozNyBBTSBSYXp2YW4gQ29qb2NhcnUKPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gTW92ZSBwMm1fe2dldC9zZXR9X3N1cHByZXNz
X3ZlKCkgdG8gcDJtLmMsIHJlcGxhY2UgaW5jb3JyZWN0Cj4gQVNTRVJUKCkgaW4gcDJtLXB0LmMg
KHNpbmNlIGEgZ3Vlc3QgY2FuIHJ1biBpbiBzaGFkb3cgbW9kZSBldmVuIG9uCj4gYSBzeXN0ZW0g
d2l0aCB2aXJ0IGV4Y2VwdGlvbnMsIHdoaWNoIHdvdWxkIHRyaWdnZXIgdGhlIEFTU0VSVCgpKSwK
PiBtb3ZlIHRoZSBWTVgtaXNtcyAoY3B1X2hhc192bXhfdmlydF9leGNlcHRpb25zIGNoZWNrcykg
dG8KPiBwMm1fZXB0X3tnZXQvc2V0fV9lbnRyeSgpLCBhbmQgZml4IGxvY2tpbmcgY29kZSBpbgo+
IHAybV9nZXRfc3VwcHJlc3NfdmUoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IFJhenZhbiBDb2pvY2Fy
dSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KClRoaXMgbG9va3MgZ29vZCwgdGhhbmtzOyBi
dXQgaXQgZG9lc24ndCBhcHBseSBjbGVhbmx5IHRvIHN0YWdpbmcKYW55bW9yZS4gIENhbiB5b3Ug
ZG91YmxlLWNoZWNrIHRvIG1ha2Ugc3VyZSBub3RoaW5nIGltcG9ydGFudCBoYXMKY2hhbmdlZCBp
biB0aGUgbW92ZWQgZnVuY3Rpb25zIHdpdGhpbiBtZW1fYWNjZXNzLmMsIGFuZCB0aGVuIHJlc2Vu
ZCBhCnJlYmFzZWQgcGF0Y2g/CgpUaGFua3MsCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
