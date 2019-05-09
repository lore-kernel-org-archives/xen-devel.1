From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 0/3] x86/mm: guest_physmap_add_*() adjustments
Date: Thu, 09 May 2019 07:40:27 -0600
Message-ID: <5CD42DCB020000780022D317@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOjHi-0005t5-BU
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 13:40:30 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UGF0Y2ggMSBpcyByZWFsbHkgaW5kZXBlbmRlbnQsIGJ1dCBwYXRjaCAyIHJlbGllcyBvbiBpdCBi
ZWluZyBpbiBwbGFjZS4KUGF0Y2ggMiBpdHNlbGYgd2FzIGFkZGVkIGFzIGEgcmVzdWx0IG9mIHRo
ZSBkaXNjdXNzaW9uIG9mIHBhdGNoIDMncwp2MSAod2hpY2ggd2FzIHByZXZpb3VzbHkgYSBzdGFu
ZGFsb25lIG9uZSkuCgoxOiBzaG9ydC1jaXJjdWl0IEhWTS1vbmx5IG1vZGUgZmxhZ3Mgd2hlbiAh
SFZNCjI6IG1ha2UgZ3Vlc3RfcGh5c21hcF9hZGRfZW50cnkoKSBIVk0tb25seQozOiBzdWJzdW1l
IHNldF9ncGZuX2Zyb21fbWZuKCkgaW50byBndWVzdF9waHlzbWFwX2FkZF9wYWdlKCkKCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
