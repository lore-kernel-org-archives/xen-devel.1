From: Sasha Levin <sashal@kernel.org>
Subject: Re: [tip:x86/urgent] x86/entry/64/compat: Fix stack
 switching for XEN PV
Date: Tue, 22 Jan 2019 15:56:03 +0000
Message-ID: <20190122155604.9518B217D6@mail.kernel.org>
References: <tip-fc24d75a7f91837d7918e40719575951820b2b8f@git.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gFl/=P6=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1glyPG-0003zo-La
 for xen-devel@lists.xenproject.org; Tue, 22 Jan 2019 15:56:06 +0000
In-Reply-To: <tip-fc24d75a7f91837d7918e40719575951820b2b8f@git.kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sasha Levin <sashal@kernel.org>, tip-bot for Jan Beulich <tipbot@zytor.com>, linux-tip-commits@vger.kernel.org
Cc: luto@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, jbeulich@suse.com, Peter Anvin <hpa@zytor.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpbVGhpcyBpcyBhbiBhdXRvbWF0ZWQgZW1haWxdCgpUaGlzIGNvbW1pdCBoYXMgYmVlbiBw
cm9jZXNzZWQgYmVjYXVzZSBpdCBjb250YWlucyBhICJGaXhlczoiIHRhZywKZml4aW5nIGNvbW1p
dDogN2YyNTkwYTExMGI4IHg4Ni9lbnRyeS82NDogVXNlIGEgcGVyLUNQVSB0cmFtcG9saW5lIHN0
YWNrIGZvciBJRFQgZW50cmllcy4KClRoZSBib3QgaGFzIHRlc3RlZCB0aGUgZm9sbG93aW5nIHRy
ZWVzOiB2NC4yMC4zLCB2NC4xOS4xNiwgdjQuMTQuOTQuCgp2NC4yMC4zOiBCdWlsZCBPSyEKdjQu
MTkuMTY6IEJ1aWxkIE9LIQp2NC4xNC45NDogRmFpbGVkIHRvIGFwcGx5ISBQb3NzaWJsZSBkZXBl
bmRlbmNpZXM6CiAgICAwZTM0ZDIyNjM0MmMgKCJ4ODYvZW50cnkvNjQ6IE1vdmUgUFVTSF9BTkRf
Q0xFQVJfUkVHUyBmcm9tIGludGVycnVwdCBtYWNybyB0byBoZWxwZXIgZnVuY3Rpb24iKQogICAg
MmJhNjQ3NDEwNGExICgieDg2L2VudHJ5LzY0OiBNb3ZlIEVOVEVSX0lSUV9TVEFDSyBmcm9tIGlu
dGVycnVwdCBtYWNybyB0byBpbnRlcnJ1cHRfZW50cnkiKQogICAgOTBhNmFjYzRlN2ViICgieDg2
L2VudHJ5LzY0OiBNb3ZlIHRoZSBzd2l0Y2hfdG9fdGhyZWFkX3N0YWNrKCkgY2FsbCB0byBpbnRl
cnJ1cHRfZW50cnkoKSIpCiAgICA5MWM1ZjBkZTY0YTIgKCJ4ODYvZW50cnkvNjQvY29tcGF0OiBT
YXZlIG9uZSBpbnN0cnVjdGlvbiBpbiBlbnRyeV9JTlQ4MF9jb21wYXQoKSIpCiAgICBiMjg1NWQ4
ZDJkZTAgKCJ4ODYvZW50cnkvNjQ6IE1vdmUgQVNNX0NMQUMgdG8gaW50ZXJydXB0X2VudHJ5KCki
KQogICAgZjNkNDE1ZWE0Njk2ICgieDg2L2VudHJ5LzY0OiBPcGVuLWNvZGUgc3dpdGNoX3RvX3Ro
cmVhZF9zdGFjaygpIikKCgpIb3cgc2hvdWxkIHdlIHByb2NlZWQgd2l0aCB0aGlzIHBhdGNoPwoK
LS0KVGhhbmtzLApTYXNoYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
