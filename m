From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 4/8] x86/XPTI: use %r12 to write zero
 into xen_cr3
Date: Wed, 21 Mar 2018 08:52:01 +0100
Message-ID: <e055ff78-70e9-8774-7345-10b96701e13e@suse.com>
References: <5AAFC9E202000078001B36F7@prv-mh.provo.novell.com>
 <5AAFCBA602000078001B3710@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=n5/p=gl=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eyYXU-00065Y-7q
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 07:52:04 +0000
In-Reply-To: <5AAFCBA602000078001B3710@suse.com>
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

T24gMTkvMDMvMTggMTQ6MzksIEphbiBCZXVsaWNoIHdyb3RlOgo+IE5vdyB0aGF0IHdlIHplcm8g
YWxsIHJlZ2lzdGVycyBlYXJseSBvbiBhbGwgZW50cnkgcGF0aHMsIHVzZSB0aGF0IHRvCj4gYXZv
aWQgYSBjb3VwbGUgb2YgaW1tZWRpYXRlcyBoZXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClRlc3RlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
