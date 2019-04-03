From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH] x86/altp2m: treat view 0 as the hostp2m in
 p2m_get_mem_access()
Date: Wed, 3 Apr 2019 07:24:44 -0600
Message-ID: <CABfawhm28k-vtc_K374aiX_cp2FNHZMvRnJVoFDP-LMyfafW6A@mail.gmail.com>
References: <1554281797-21368-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xd2E=SF=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hBftN-0007Pw-V5
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 13:25:26 +0000
Received: by mail-wr1-f50.google.com with SMTP id t17so8306807wrw.13
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2019 06:25:21 -0700 (PDT)
In-Reply-To: <1554281797-21368-1-git-send-email-rcojocaru@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBcHIgMywgMjAxOSBhdCAyOjU2IEFNIFJhenZhbiBDb2pvY2FydQo8cmNvam9jYXJ1
QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPiBwMm1fc2V0X21lbV9hY2Nlc3MoKSAoYW5kIG90
aGVyIHBsYWNlcykgdHJlYXQgdmlldyAwIGFzIHRoZQo+IGhvc3RwMm0sIGJ1dCBwMm1fZ2V0X21l
bV9hY2Nlc3MoKSBkb2VzIG5vdC4gQ29ycmVjdCB0aGF0Cj4gaW5jb25zaXN0ZW5jeS4KPgo+IFNp
Z25lZC1vZmYtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4K
CkFja2VkLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
