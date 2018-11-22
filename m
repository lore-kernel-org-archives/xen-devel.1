From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 02/14] x86/mem-sharing: Don't leave the
 altp2m lock held when nominating a page
Date: Thu, 22 Nov 2018 07:46:04 -0700
Message-ID: <5BF6C12C02000078001FEF83@prv1-mh.provo.novell.com>
References: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
 <1542806482-24030-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542806482-24030-3-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjExLjE4IGF0IDE0OjIxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gZ2V0X2dmbl90eXBlX2FjY2VzcygpIGludGVybmFsbHkgdGFrZXMgdGhlIHAybSBsb2Nr
LCBhbmQgbm90aGluZyBldmVyIHVubG9ja3MKPiBpdC4gIFN3aXRjaCB0byB1c2luZyB0aGUgdW5s
b2NrZWQgYWNjZXNzb3IgaW5zdGVhZC4KPiAKPiBUaGlzIHdhc24ndCBpbmNsdWRlZCBpbiBYU0Et
Mjc3IGJlY2F1c2UgbmVpdGhlciBtZW0tc2hhcmluZyBub3IgYWx0cDJtIGFyZQo+IHN1cHBvcnRl
ZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgoKU2FtZSBoZXJlOgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgp3YXMgZWZmZWN0aXZlbHkgYWxyZWFkeSBnaXZlbi4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
