From: Julien Grall <julien.grall@arm.com>
Subject: Re: Xen GCC coverage ARM64 testing - Unexpected Trap:
 Data Abort
Date: Mon, 13 May 2019 09:39:13 +0100
Message-ID: <4fb5058d-9810-7a1b-91f4-db31bad82a85@arm.com>
References: <CAOcoXZZtsXQMp0EzFAa2WEBL1sEUcFsNozaQshsnNEs3=NQK3g@mail.gmail.com>
 <CAOcoXZY6jpPKcWTXPqz0sr=Amw7J0KSaBRWiRnQRgTC2XR=hjQ@mail.gmail.com>
 <f95ad35b-42f6-4df2-cade-7a8115f9e49a@arm.com>
 <CAOcoXZaMLfHSyLSE04xRFZZY0hLkFcJ5cBqHTdmwDoqwcreD1w@mail.gmail.com>
 <ff543e3c-0619-5aa6-b36a-e1a8b8cce886@arm.com>
 <20190503110819.GA5900@zion.uk.xensource.com>
 <63ea8905-87ca-a419-95bf-ae497bf1ff85@arm.com>
 <20190503134133.GC5900@zion.uk.xensource.com>
 <b0947b60-d89a-54a5-a11b-708b64ff8053@arm.com>
 <20190503141952.GD5900@zion.uk.xensource.com>
 <CAOcoXZZau01-5Tmab9eCcYKJavzrT_9KdNa_dR+QN5zKmmXMoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nxsn=TN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQ6UQ-00034T-8E
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 08:39:18 +0000
In-Reply-To: <CAOcoXZZau01-5Tmab9eCcYKJavzrT_9KdNa_dR+QN5zKmmXMoA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrii_Anisov@epam.com, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiA1LzEzLzE5IDk6MTggQU0sIFZpa3RvciBNaXRpbiB3cm90ZToKPiBIaSBKdWxpZW4sCgpI
aSwKCj4gUGxlYXNlIGJlIGF3YXJlIHRoYXQgdGhlIHBhdGNoIHlvdSBwcm9wb3NlZCAoK25vY292
LXkgKz0gbGliZmR0Lm8pCj4gZmFpbGVkIHRvIGJ1aWxkIHdpdGggdGhlIG5leHQgZXJyb3IgKHhl
biA0LjEyKToKCk15IHBhdGNoIGlzIGJhc2VkIG9uIDQuMTMsIGFsdGhvdWdoIHNob3VsZCB3b3Jr
IG9uIFhlbiA0LjEyLiBCdXQuLi4KCj4gCj4gYWFyY2g2NC1wb2t5LWxpbnV4LWdjYyAgIC1EQlVJ
TERfSUQgLWZuby1zdHJpY3QtYWxpYXNpbmcgLXN0ZD1nbnU5OQo+IC1XYWxsIC1Xc3RyaWN0LXBy
b3RvdHlwZXMgLVdkZWNsYXJhdGlvbi1hZnRlci1zdGF0ZW1lbnQKPiAtV25vLXVudXNlZC1idXQt
c2V0LXZhcmlhYmxlIC1Xbm8tdW51c2VkLWxvY2FsLXR5cGVkZWZzICAgLU8yCj4gLWZvbWl0LWZy
YW1lLXBvaW50ZXIKPiAtRF9fWEVOX0lOVEVSRkFDRV9WRVJTSU9OX189X19YRU5fTEFURVNUX0lO
VEVSRkFDRV9WRVJTSU9OX18gLU1NRCAtTUYKPiAuaGFuZGxlcmVnLm8uZCAtRF9MQVJHRUZJTEVf
U09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAgIC1XZXJyb3IKPiAtV21pc3NpbmctcHJvdG90
eXBlcyAtSS4vaW5jbHVkZQo+IC1JL2hvbWUvYy93L3JjYXJfaDNfdWJ1bnR1MTYwNF95b2N0by9i
dWlsZC90bXAvd29yay9hYXJjaDY0LXBva3ktbGludXgveGVuLzQuMTIuMC4wK2dpdEFVVE9JTkMr
ZmQyYTM0Yzk2NS1yMC9naXQvdG9vbHMvbGlicy90b29sY29yZS8uLi8uLi8uLi90b29scy9pbmNs
dWRlCj4gICAtYyAtbyBoYW5kbGVyZWcubyBoYW5kbGVyZWcuYwoKLi4uIHRoaXMgbG9va3MgbGlr
ZSBhIHRvb2wgYnVpbGRpbmcgZXJyb3Igd2hlbiBJIG9ubHkgdG91Y2ggdGhlIApoeXBlcnZpc29y
IHBhcnQuIEFyZSB5b3UgY2VydGFpbiB0aGlzIGlzIG15IHBhdGNoIGFuZCBub3QgYW5vdGhlciBl
cnJvciAKaW4gWGVuIDQuMTIgKG9yIGFueSBwYXRjaCB5b3UgaGF2ZSBvbiB0b3ApPwoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
