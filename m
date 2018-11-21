From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH] x86/mem_access: move
 p2m_mem_access_sanity_check() from header
Date: Tue, 20 Nov 2018 19:34:05 -0700
Message-ID: <CABfawh=8L=u16MLNnRbDPjDTGMK9uKfFwg2ZMhgk_QHQPzGKDw@mail.gmail.com>
References: <1542737127-17695-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j9eg=oa=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gPILo-0006T6-1e
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 02:34:48 +0000
Received: by mail-ed1-f65.google.com with SMTP id b3so3664951ede.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Nov 2018 18:34:46 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47])
 by smtp.gmail.com with ESMTPSA id b49sm10673749edb.73.2018.11.20.18.34.43
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Nov 2018 18:34:44 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id c126so4176270wmh.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Nov 2018 18:34:43 -0800 (PST)
In-Reply-To: <1542737127-17695-1-git-send-email-rcojocaru@bitdefender.com>
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

T24gVHVlLCBOb3YgMjAsIDIwMTggYXQgMTE6MDUgQU0gUmF6dmFuIENvam9jYXJ1CjxyY29qb2Nh
cnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPgo+IE1vdmUgcDJtX21lbV9hY2Nlc3Nfc2FuaXR5
X2NoZWNrKCkgZnJvbSB0aGUgYXNtLXg4Ni9tZW1fYWNjZXNzLmgKPiBoZWFkZXIsIHdoZXJlIGl0
IGN1cnJlbnRseSBpcyBkZWNsYXJlZCBpbmxpbmUsIHRvCj4gYXJjaC94ODYvbW0vbWVtX2FjY2Vz
cy5jLiBUaGlzIGFsbG93cyBzb3VyY2UgY29kZSB0aGF0IGluY2x1ZGVzIGl0Cj4gZGlyZWN0bHks
IG9yIGluZGlyZWN0bHkgKHN1Y2ggYXMgeGVuL21lbV9hY2Nlc3MuaCksIHRvIG5vdCB3b3JyeQo+
IGFib3V0IGFsc28gaW5jbHVkaW5nIHNjaGVkLmggZm9yIGlzX2h2bV9kb21haW4oKS4gSW5jbHVk
aW5nCj4geGVuL21lbV9hY2Nlc3MuaCBpcyB1c2VmdWwgZm9yIGNvZGUgd2FudGluZyB0byB1c2Ug
cDJtX2FjY2Vzc190Lgo+Cj4gU2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2Nh
cnVAYml0ZGVmZW5kZXIuY29tPgoKQWNrZWQtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGts
ZW5neWVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
