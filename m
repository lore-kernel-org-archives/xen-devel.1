From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/msr: further correct the emulation
 behaviour of MSR_PRED_CMD
Date: Tue, 17 Apr 2018 16:28:08 +0200
Message-ID: <123d7c56-22be-0721-f5e5-c4cab95aad6c@suse.com>
References: <5AD5DD8202000078001BC0B7@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hi3k=hg=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f8Rad-0002Yk-91
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 14:28:11 +0000
In-Reply-To: <5AD5DD8202000078001BC0B7@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDQvMTggMTM6NDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEZvbGxvd2luZyBjb21taXQg
YTZhYTY3OGZhMyAoIng4Ni9tc3I6IENvcnJlY3QgdGhlIGVtdWxhdGlvbiBiZWhhdmlvdXIKPiBv
ZiBNU1JfUFJFRF9DTUQiKSB3ZSBtYXkgZW5kIHVwIHdyaXRpbmcgdGhlIGxvdyBiaXQgd2l0aCB0
aGUgd3JvbmcKPiB2YWx1ZS4gV2hpbGUgaXQncyB1bmxpa2VseSBmb3IgYSBndWVzdCB0byB3YW50
IHRvIHdyaXRlIHplcm8gdGhlcmUsIHdlCj4gc2hvdWxkIHN0aWxsIHBlcm1pdCAodGhpcyB3aXRo
b3V0IGluY3VycmluZyB0aGUgb3ZlcmhlYWQgb2YgYW4gYWN0dWFsCj4gYmFycmllcikuIENvcnJl
Y3RpbmcgdGhpcyByaWdodCBhd2F5IHdpbGwgYWxzbyBoZWxwIHdoZW5ldmVyIGZ1cnRoZXIKPiBi
aXRzIGluIHRoZSBNU1IgbWlnaHQgYmVjb21lIGRlZmluZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
