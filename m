From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH 02/14] x86/mem-sharing: Don't leave the
 altp2m lock held when nominating a page
Date: Wed, 21 Nov 2018 09:56:20 -0700
Message-ID: <CABfawh=tcfCOWGaCqAzYJALLip9onxYR7hMJN+jUwO2ykZ6CUg@mail.gmail.com>
References: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
 <1542806482-24030-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542806482-24030-3-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjEsIDIwMTggYXQgNjoyMSBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IGdldF9nZm5fdHlwZV9hY2Nlc3MoKSBpbnRlcm5h
bGx5IHRha2VzIHRoZSBwMm0gbG9jaywgYW5kIG5vdGhpbmcgZXZlciB1bmxvY2tzCj4gaXQuICBT
d2l0Y2ggdG8gdXNpbmcgdGhlIHVubG9ja2VkIGFjY2Vzc29yIGluc3RlYWQuCj4KPiBUaGlzIHdh
c24ndCBpbmNsdWRlZCBpbiBYU0EtMjc3IGJlY2F1c2UgbmVpdGhlciBtZW0tc2hhcmluZyBub3Ig
YWx0cDJtIGFyZQo+IHN1cHBvcnRlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogVGFtYXMgSyBMZW5neWVsIDx0
YW1hc0B0a2xlbmd5ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
