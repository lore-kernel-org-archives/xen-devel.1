From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 30/34] x86: PIT emulation is common to PV
 and HVM
Date: Tue, 21 Aug 2018 10:03:26 +0200
Message-ID: <20180821080326.ocxvzkxtulyxrpeq@mac>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <ff0a741aa240f10a4d113db25e6df9f43f48f6f3.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=js+4=le=citrix.com=prvs=7646db883=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fs1kt-0002h6-ON
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 08:11:11 +0000
Content-Disposition: inline
In-Reply-To: <ff0a741aa240f10a4d113db25e6df9f43f48f6f3.1534518694.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMTcsIDIwMTggYXQgMDQ6MTI6NDhQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBNb3ZlIHRoZSBjb21tb24gcGFydHMgdG8gZW11bC1pODI1NC5jLiBUaGlzIHJlcXVpcmVzIG1v
dmluZyBzb21lIG9mCj4gdGhlIG1hY3JvcyB0byB2cHQuaC4gU29tZSBvZiB0aGUgY29kZSBpbiBj
b21tb24gY29kZSBpcyBwdXQgdW5kZXIKPiBpc19odm1fKiBjaGVja3Mgc28gdGhhdCBEQ0UgY2Fu
IGtpY2sgaW4uIEZhY3RvciBvdXQgSFZNIG9ubHkKPiBwaXRfbG9hZF9jb3VudF9jaGFubmVsMCB0
byByZWR1Y2UgYW1vdW50IG9mIGNvZGUgaW4geDg2IGNvbW1vbiBjb2RlLgo+IAo+IExlYXZlIEhW
TSBzcGVjaWZpYyBjb2RlIHdoZXJlIGl0IHdhcyBiZWZvcmUuCgpJTU8gSSB3b3VsZCByYXRoZXIg
aGF2ZSB0aGUgd2hvbGUgZW11bGF0aW9uIGNvZGUgaW4gYSBzaW5nbGUgZmlsZSBhbmQKdGhlIEhW
TSBvbmx5IGZ1bmN0aW9ucyBndWFyZGVkIGJ5IENPTkZJR19IVk0uIEkgdGhpbmsgaXQncyBlYXNp
ZXIgdG8KZmluZCBhbmQgdW5kZXJzdGFuZCB0aGUgY29kZSBpZiBpdCdzIGFsbCBwbGFjZWQgaW4g
YSBzaW5nbGUgZmlsZS4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
