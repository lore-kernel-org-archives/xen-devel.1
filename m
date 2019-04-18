From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH fuzzer v1] Added the --ignore-sigill option
 for AFL fuzzing
Date: Thu, 18 Apr 2019 17:18:38 +0100
Message-ID: <bf2d1ac9-ae2f-4e37-f7ab-7d21373fb597@citrix.com>
References: <20190418150238.15352-1-samcacc@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OZB7=SU=citrix.com=prvs=004a5fe52=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hH9ke-0000Nm-5e
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:19:04 +0000
In-Reply-To: <20190418150238.15352-1-samcacc@amazon.de>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sam Caccavale <samcacc@amazon.de>, xen-devel@lists.xenproject.org
Cc: Martin Pohlack <mpohlack@amazon.de>, Pawel Wieczorkiewicz <wipawel@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, Bjoern Doebel <doebel@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDQvMjAxOSAxNjowMiwgU2FtIENhY2NhdmFsZSB3cm90ZToKPiBBcyBvZiBub3csIHRo
ZSB4ODZfaW5zdHJ1Y3Rpb25fZW11bGF0b3Igd2lsbCBleGVjdXRlIG9wY29kZXMKPiBiZWxvbmdp
bmcgdG8gQ1BVIGV4dGVuc2lvbnMgdGhhdCB0aGUgaG9zdCBtYXkgbm90IGhhdmUuCj4gU3BlY2lm
eWluZyAtLWlnbm9yZS1zaWdpbGwgd2hlbiBydW5uaW5nIGFmbC1oYXJuZXNzIHdpbGwgaWdub3Jl
Cj4gYWxsIFNJR19JTEwgaW5jbHVkaW5nIHRob3NlIGdlbmVyYXRlZCBieSB0aGUgYWJvdmUgaXNz
dWUuCgpXaGljaCBpbnN0cnVjdGlvbnM/wqAgV2Ugc3BlY2lmaWNhbGx5IGRpZG4ndCBhZGQgYSBT
SUdfSUxMIGhhbmRsZXIgaW4gdGhlCmZpcnN0IHBsYWNlIHRvIGNhdGNoIG1pc3Rha2VzIGxpa2Ug
dGhpcyBzbyB3ZSBjYW4gZml4IHRoZW0uCgpXZSd2ZSBnb3QgcHJvdGVjdGlvbiBpbiBwbGFjZSBz
byBzdWNoIGEgbWlzdGFrZSBpc24ndCBhbiBYU0EgYW55IG1vcmUsCmJ1dCBpdCBpcyBzdGlsbCBh
biBlcnJvciB3ZSdkIGxpa2UgdG8gZml4IGluIHRoZSBlbXVsYXRvci4KCn5BbmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
