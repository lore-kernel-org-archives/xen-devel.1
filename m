From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH] x86/p2m: constify
 p2m_mem_access_sanity_check()
Date: Wed, 21 Nov 2018 13:59:44 +0200
Message-ID: <c8c8de75-d5aa-80c7-8682-094a3478c2d6@bitdefender.com>
References: <1542798100-840-1-git-send-email-rcojocaru@bitdefender.com>
 <f2283654-f99e-6ed0-22f8-8cad9d2041f8@citrix.com>
 <5BF5446F02000078001FE6EA@prv1-mh.provo.novell.com>
 <c7558f00-3330-de7b-7e98-26d9b88ea6ea@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RqMg=OA=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gPRAf-0002wg-5L
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 11:59:53 +0000
In-Reply-To: <c7558f00-3330-de7b-7e98-26d9b88ea6ea@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjEvMTggMTo1MiBQTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMS8yMS8xOCAx
MTo0MSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIxLjExLjE4IGF0IDEyOjAzLCA8
Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPj4+IE9uIDExLzIxLzE4IDExOjAxIEFN
LCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4+Pj4gU2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9j
YXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+Pj4KPj4+IFdoeT8KPj4KPj4gQXJlIHlv
dSBhc2tpbmcgaW4gZ2VuZXJhbCAoSSB0aGluayBpdCdzIG9idmlvdXMpLCBvciBtZXJlbHkgYmVj
YXVzZQo+PiB0aGUgY29tbWl0IGRlc2NyaXB0aW9uIGlzIGVtcHR5Pwo+IAo+IEkgZGlkbid0IHNl
ZSB0aGF0IHlvdSBoYWQgc3VnZ2VzdGVkIGl0IGFzIGEgdHJpdmlhbCBpbXByb3ZlbWVudC4KPiAK
PiBJIGFncmVlIGl0J3MgYSBtaW5vciBpbXByb3ZlbWVudCwgYnV0IG5vcm1hbGx5IHN1Y2ggaW1w
cm92ZW1lbnRzIGRvbid0Cj4gY29tZSBpbiBvdXQgb2YgdGhlIGJsdWU6IHRoZXkncmUgZG9uZSBp
biBvcmRlciB0byBhY2hpZXZlIHNvbWUgZ29hbCAoZm9yCj4gZXhhbXBsZSwgdG8gYWxsb3cgdGhp
cyBmdW5jdGlvbiB0byBiZSBjYWxsZWQgZnJvbSBhbm90aGVyIGZ1bmN0aW9uIHRoYXQKPiBvbmx5
IGhhcyBhIGNvbnN0IHBvaW50ZXIpLiAgUmVjb3JkaW5nIHRoZSBtb3RpdmF0aW9uIGlzIGltcG9y
dGFudDsgSSdkCj4gYXJndWUgdGhhdCByZWNvcmRpbmcgdGhlIGxhY2sgb2YgbW90aXZhdGlvbiBp
cyBpbXBvcnRhbnQgYXMgd2VsbCAoc28KPiB0aGF0IHBlb3BsZSBkb24ndCBnbyBsb29raW5nIGZv
ciBvbmUgdGhhdCBpc24ndCB0aGVyZSkuCgpJJ2xsIHJlc2VuZCB0aGUgcGF0Y2ggd2l0aCBhIHNt
YWxsIGRlc2NyaXB0aW9uLgpBbHNvLCBJIHNob3VsZCBoYXZlIGFkZGVkIGEgU3VnZ2VzdGVkLWJ5
IHRhZyB0aGF0IHdvdWxkIGhhdmUgY2xlYXJseQpoZWxwZWQgaW4gdGhpcyBjYXNlLCBteSBtaXN0
YWtlLgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
