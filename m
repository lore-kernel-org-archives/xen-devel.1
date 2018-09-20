From: Milan Boberic <milanboberic94@gmail.com>
Subject: Re: null scheduler bug
Date: Thu, 20 Sep 2018 15:04:06 +0200
Message-ID: <CADJ6SV0+O5c52_qwOUEakuX82C2+8Z-M4mKj0x+13GXjaiJjvw@mail.gmail.com>
References: <alpine.DEB.2.10.1809121559330.4255@sstabellini-ThinkPad-X260>
 <a938e477609ae123ae61aec515daa34ccaf0b8f3.camel@suse.com>
 <CADJ6SV2G=51BK2p-bouNGfiS5sP2tiV6ztZZ7PFGjiptRw_P3w@mail.gmail.com>
 <44174941bcd8f250a6ecd42ea10a78bf12453134.camel@suse.com>
 <CADJ6SV2wis2kOz9j4OGTzRLd+2O2f_SuxktFWRq2A_tbng_3Ug@mail.gmail.com>
 <529d38d04b140d90d33e424a064d401cf06f14cf.camel@suse.com>
 <CADJ6SV09MS1x+qGJOu71W8M6cVhRaVuODBYDReHWmOm4c1NEfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ahgi=mc=gmail.com=milanboberic94@srs-us1.protection.inumbo.net>)
 id 1g2yd3-0005Bl-FM
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 13:04:21 +0000
Received: by mail-lj1-x236.google.com with SMTP id p6-v6so8311968ljc.5
 for <xen-devel@lists.xenproject.org>; Thu, 20 Sep 2018 06:04:19 -0700 (PDT)
In-Reply-To: <CADJ6SV09MS1x+qGJOu71W8M6cVhRaVuODBYDReHWmOm4c1NEfQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: xen-devel@lists.xenproject.org, stefano@stabellini.net
List-Id: xen-devel@lists.xenproject.org

SSByYW4gc29tZSBtb3JlIHRlc3RzIGFuZCBtYW5hZ2VkIHRvIHN1Y2Nlc3NmdWxseSBjcmVhdGUg
YW5kIGRlc3Ryb3kKZG9tVSBhcyBtYW55IHRpbWVzIGFzIEkgd2FudCwgd2l0aG91dCBhbnkgZGVs
YXkgYmV0d2VlbiBkZXN0cm95IGFuZApjcmVhdGUuCkkgYWRkZWQ6CiBwcmludGsoIkVuZCBvZiBh
IGRvbWFpbl9kZXN0cm95IGZ1bmN0aW9uIik7CiBpbiBkb21haW5fZGVzdHJveSBmdW5jdGlvbiBh
bmQKcHJpbnRrKCJFbmQgb2YgYSBjb21wbGV0ZV9kb21haW5fZGVzdHJveSBmdW5jdGlvbiIpOyBp
bgpjb21wbGV0ZV9kb21haW5fZGVzdHJveSBmdW5jdGlvbiwgYXQgdGhlIGVuZCBvZiB0aGUgZnVu
Y3Rpb25zLgpUaG9zZSBmdW5jdGlvbnMgYXJlIGluIGRvbWFpbi5jIGZpbGUuCk5vdywgYWZ0ZXIg
ZXZlcnkgeGwgY3JlYXRlIGl0IHByaW50czoKCnJvb3RAdXozZWctaW9jYy0yMDE4LTI6fiMgeGwg
Y3JlYXRlIGJtMS5jZmcKUGFyc2luZyBjb25maWcgZnJvbSBibTEuY2ZnCjxHPjwzPm1lbW9yeV9t
YXA6YWRkOiBkb20yIGdmbj1mZjBhMCBtZm49ZmYwYTAgbnI9MQoKClRoaXMgbGluZSBuZXZlciBw
cmludGVkIGJlZm9yZSBidXQgaXQgZG9lc24ndCBhZmZlY3QgYW55dGhpbmc6CjxHPjwzPm1lbW9y
eV9tYXA6YWRkOiBkb20yIGdmbj1mZjBhMCBtZm49ZmYwYTAgbnI9MQoKSSB0cmllZCByZW1vdmlu
ZyBwcmludGsgZnJvbSBmdW5jdGlvbnMgYW5kIEkgZ290IHNhbWUgcHJvYmxlbSBsaWtlIGJlZm9y
ZS4KCkRvIHlvdSBndXlzIGhhdmUgYW55IGlkZWEgd2hhdCBpcyBnb2luZyBvbiBoZXJlPwpUaGFu
a3MgaW4gYWR2YW5jZSwgYmVzdCByZWdhcmRzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
