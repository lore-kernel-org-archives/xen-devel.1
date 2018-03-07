From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [OSSTEST PATCH v2 08/19] ts-guests-nbd-mirror: use
	target_{get, put}file_root to transfter cfg
Date: Wed, 7 Mar 2018 15:04:41 +0000
Message-ID: <23199.65417.402495.909095@mariner.uk.xensource.com>
References: <20171031135203.11537-1-wei.liu2@citrix.com>
 <20171031135203.11537-9-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yqaj=f5=citrix.com=prvs=597a3b2b9=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1etacq-0003tW-6Y
 for xen-devel@lists.xenproject.org; Wed, 07 Mar 2018 15:05:04 +0000
In-Reply-To: <20171031135203.11537-9-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJbT1NTVEVTVCBQQVRDSCB2MiAwOC8xOV0gdHMtZ3Vlc3RzLW5iZC1t
aXJyb3I6IHVzZSB0YXJnZXRfe2dldCxwdXR9ZmlsZV9yb290IHRvIHRyYW5zZnRlciBjZmciKToK
PiBUaGUgb3JpZ2luYWwgY29kZSB1c2VkIHRhcmdldF9jbWRfb3V0cHV0X3Jvb3Qgd2hpY2ggY2F1
c2VkIGEgdHJhaWxpbmcKPiBuZXcgbGluZSB0byBiZSBkZWxldGVkLCB3aGljaCBjYXVzZWQgbGli
dmlydCBjb252ZXJ0ZXIgdG8gZmFpbC4KPiAKPiBJdCB3YXNuJ3QgZGlzY292ZXJlZCB1bnRpbCBu
b3cgYmVjYXVzZSB3ZSBhcHBlbmRlZCB0b28gbWFueSAiXG4iLgo+IAo+IFVzZSB0YXJnZXRfe2dl
dCxwdXR9ZmlsZV9yb290IHRvIGRvIHRoZSBqb2IuCgpNYXliZSB0YXJnZXRfZ2V0ZmlsZWNvbnRl
bnRzIGFuZCBzdGFzaGZpbGVjb250ZW50cyBhbmQKdGFyZ2V0X3B1dGZpbGVjb250ZW50cyB3b3Vs
ZCBiZSBlYXNpZXIgYW5kIGFsc28gYmV0dGVyID8KCkl0IGlzIHVzdWFsbHkgYmV0dGVyIHRvIHVz
ZSB0aGUgZXhpc3RpbmcgZmFjaWxpdGllcyBmb3IgaW52ZW50aW5nCnN0YXNoIGZpbGUgbmFtZXMg
YmVjYXVzZSB0aGV5IGNoZWNrIGZvciB1bmlxdWVuZXNzLgoKT3IgbWF5YmUgeW91IHdhbnQgdG8g
aW52ZW50IGB0YXJnZXRfZ2V0ZmlsZV9zdGFzaCcgd2hpY2ggdXNlcwpvcGVuX3VuaXF1ZV9zdGFz
aGZpbGUgYW5kIHRhcmdldF9nZXRmaWxlLCBhbmQgcmV0dXJucyB0aGUgZmlsZW5hbWUuCgpJYW4u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
