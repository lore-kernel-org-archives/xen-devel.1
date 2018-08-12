From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3 13/17] x86/xen: enable Hygon support to
 Xen
Date: Sun, 12 Aug 2018 09:26:58 -0400
Message-ID: <150f6a8d-33e8-a84d-f34b-17bdb7264ebe__4593.60613390363$1534080373$gmane$org@oracle.com>
References: <cover.1533989492.git.puwen@hygon.cn>
 <2747ad959f07459000f2693a98d237e2b3149ca1.1533989493.git.puwen@hygon.cn>
 <b32887e0-df6e-fb31-d9cd-6b31961c9c2b@oracle.com>
 <0aa44410-47ec-27e2-10d9-c0dc5d2e457a@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4phv=k3=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1foqOl-0005pe-Ow
 for xen-devel@lists.xenproject.org; Sun, 12 Aug 2018 13:27:11 +0000
In-Reply-To: <0aa44410-47ec-27e2-10d9-c0dc5d2e457a@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Pu Wen <puwen@hygon.cn>, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, thomas.lendacky@amd.com, bp@alien8.de, pbonzini@redhat.com, JBeulich@suse.com
Cc: linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMTIvMjAxOCAwNDo1NSBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxMS8wOC8x
OCAxNjozNCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAwOC8xMS8yMDE4IDA5OjI5IEFN
LCBQdSBXZW4gd3JvdGU6Cj4+Cj4+PiAgCj4+PiAgYm9vbCBwbXVfbXNyX3JlYWQodW5zaWduZWQg
aW50IG1zciwgdWludDY0X3QgKnZhbCwgaW50ICplcnIpCj4+PiAgewo+Pj4gLQlpZiAoYm9vdF9j
cHVfZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfQU1EKSB7Cj4+PiArCWlmIChib290X2Nw
dV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9BTUQgfHwKPj4+ICsJICAgIGJvb3RfY3B1
X2RhdGEueDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX0hZR09OKSB7Cj4+Cj4+ICdpZiAoYm9vdF9j
cHVfZGF0YS54ODZfdmVuZG9yICE9IFg4Nl9WRU5ET1JfSU5URUwpJyBwbGVhc2UuCj4gUmVhbGx5
PyBYZW4gc3VwcG9ydHMgQ2VudGF1ciwgdG9vLgoKVlBNVSBkb2Vzbid0IC0tLSBoeXBlcnZpc29y
IHdpbGwgbm90IGluaXRpYWxpemUgaXQuIEJlc2lkZXMsIHRoZQpleGlzdGluZyBjb2RlIHdpbGwg
c3RlZXIgbm9uLUFNRCBleGVjdXRpb24gdG8gSW50ZWwsIHdoaWNoIGlzIG5vdCByaWdodAplaXRo
ZXIuCgpJJ2xsIGFkZCBhIGNoZWNrIHRvIGJhaWwgaWYgVlBNVSBpcyBub3QgaW5pdGlhbGl6ZWQg
cHJvcGVybHksIHdlIHNlZW0gdG8KaWdub3JlIHhlbl9wbXVfaW5pdCgpIGZhaWx1cmVzLiBXaGlj
aCwgQlRXLCBtYWtlcyB0aGlzIHBhdGNoIHJhdGhlcgpwb2ludGxlc3MgdW50aWwgdGhlcmUgaXMg
c3VwcG9ydCBmb3IgSHlnb24gWGVuLgoKLWJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
