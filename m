From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/4] xen/watchdog: Rearrange the logic to
 fold the timer-arming paths
Date: Mon, 13 May 2019 14:18:04 +0100
Message-ID: <782f4a40-edfe-accf-212c-3f5345c4534c@citrix.com>
References: <1557512884-32395-1-git-send-email-andrew.cooper3@citrix.com>
 <1557512884-32395-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CZq+=TN=citrix.com=prvs=029e45453=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hQAqG-0001dO-Su
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 13:18:08 +0000
In-Reply-To: <1557512884-32395-3-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Christian Lindig <christian.lindig@citrix.com>, Pau Ruiz Safont <pau.safont@citrix.com>, Julien Grall <julien.grall@arm.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDUvMjAxOSAxOToyOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBCeSByZWFycmFuZ2lu
ZyB0aGUgbG9naWMsIHRoZSB0aW1lciBhbGxvY2F0aW9uIGxvb3AgY2FuIHJldXNlIHRoZSBjb21t
b24gdGltZXIKPiBhcm1pbmcvY2xlYXJpbmcgbG9naWMuICBUaGlzIHJlc3VsdHMgaW4gZWFzaWVy
IHRvIGZvbGxvdyBjb2RlLCBhbmQgYSBtb2Rlc3QKPiByZWR1Y3Rpb24gaW4gY29tcGlsZWQgY29k
ZSBzaXplICgtNjQsIDI5MCA9PiAyMjYpLgo+Cj4gRm9yIGRvbWFpbnMgd2hpY2ggdXNlIHdhdGNo
ZG9ncywgdGhlIG92ZXJ3aGVtbGluZyBtYWpvcml5IG9mIGh5cGVyY2FsbHMgd2lsbAo+IGJlIHJl
LWFybWluZyBhbiBleGlzdGluZyB0aW1lci4gIEFycmFuZ2UgdGhlIGZhc3RwYXRoIHRvIG1hdGNo
Lgo+Cj4gVGhpcyBkb2VzIGNhdXNlIG9uZSBjaGFuZ2UgaW4gYmVoYXZpb3VyIGZvciBhIGNvcm5l
ciBjYXNlLiAgUHJldmlvdXNseSwKPiBzcGVjaWZ5aW5nIGlkID0gMCwgdGltZW91dCA9IDAgd291
bGQgaW5zdGFudGx5IGtpbGwgdGhlIGRvbWFpbiwgYXMgdGhlIHRpbWVyCj4gd291bGQgZmlyZSBi
ZWZvcmUgcmV0dXJuaW5nIHRvIHRoZSBndWVzdC4gIFRoaXMgY29ybmVyIGNhc2UgaXMgZ29pbmcg
dG8gYmUKPiByZXVzZWQgZm9yIGEgZGlmZmVyZW50IHB1cnBvc2UgaW4gYSBsYXRlciBjaGFuZ2Uu
CgpBY3R1YWxseSwgaXQgdHVybnMgb3V0IHRoYXQgdGhpcyBjb3JuZXIgY2FzZSBpcyB1c2VkIGZv
ciBkZWxpYmVyYXRlbHkKZmVuY2luZyBpbiBzb21lIGNhc2VzLgoKSSdsbCBoYXZlIHRvIGludmVu
dCBzb21lIGRpZmZlcmVudCB3YXkgb2YgY2xlYXJpbmcgYWxsIHRpbWVycy4KCn5BbmRyZXcKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
