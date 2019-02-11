From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2 1/2] x86: respect memory size limiting
 via mem= parameter
Date: Mon, 11 Feb 2019 13:06:50 +0100
Message-ID: <20190211120650.GA74879__19336.9593749352$1549886871$gmane$org@gmail.com>
References: <20190130082233.23840-1-jgross@suse.com>
 <20190130082233.23840-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UFNC=QS=gmail.com=mingo.kernel.org@srs-us1.protection.inumbo.net>)
 id 1gtAMQ-0007Xc-VN
 for xen-devel@lists.xenproject.org; Mon, 11 Feb 2019 12:06:55 +0000
Received: by mail-wm1-x341.google.com with SMTP id v26so16949741wmh.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Feb 2019 04:06:53 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20190130082233.23840-2-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: sstabellini@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

CiogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKCj4gV2hlbiBsaW1pdGlu
ZyBtZW1vcnkgc2l6ZSB2aWEga2VybmVsIHBhcmFtZXRlciAibWVtPSIgdGhpcyBzaG91bGQgYmUK
PiByZXNwZWN0ZWQgZXZlbiBpbiBjYXNlIG9mIG1lbW9yeSBtYWRlIGFjY2Vzc2libGUgdmlhIGEg
UENJIGNhcmQuCj4gCj4gVG9kYXkgdGhpcyBraW5kIG9mIG1lbW9yeSB3b24ndCBiZSBtYWRlIHVz
YWJsZSBpbiBpbml0aWFsIG1lbW9yeQo+IHNldHVwIGFzIHRoZSBtZW1vcnkgd29uJ3QgYmUgdmlz
aWJsZSBpbiBFODIwIG1hcCwgYnV0IGl0IG1pZ2h0IGJlCj4gYWRkZWQgd2hlbiBhZGRpbmcgUENJ
IGRldmljZXMgZHVlIHRvIGNvcnJlc3BvbmRpbmcgQUNQSSB0YWJsZSBlbnRyaWVzLgo+IAo+IE5v
dCByZXNwZWN0aW5nICJtZW09IiBjYW4gYmUgY29ycmVjdGVkIGJ5IGFkZGluZyBhIGdsb2JhbCBt
YXhfbWVtX3NpemUKPiB2YXJpYWJsZSBzZXQgYnkgcGFyc2VfbWVtb3B0KCkgd2hpY2ggd2lsbCBy
ZXN1bHQgaW4gcmVqZWN0aW5nIGFkZGluZwo+IG1lbW9yeSBhcmVhcyByZXN1bHRpbmcgaW4gYSBt
ZW1vcnkgc2l6ZSBhYm92ZSB0aGUgYWxsb3dlZCBsaW1pdC4KClNvIGhpc3RvcmljYWxseSAnbWVt
PXh4eE0nIHdhcyBhIHdheSB0byBxdWlja2x5IGxpbWl0IFJBTS4KCklmIFBDSSBkZXZpY2VzIGhh
ZCBwaHlzaWNhbCBtbWlvIG1lbW9yeSBhcmVhcyBhYm92ZSB0aGlzIHJhbmdlLCB3ZSdkIApzdGls
bCBleHBlY3QgdGhlbSB0byB3b3JrIC0gdGhlIG9wdGlvbiB3YXMgcmVhbGx5IG9ubHkgbWVhbnQg
dG8gbGltaXQgClJBTS4KClNvIEknbSB3b25kZXJpbmcgd2hhdCB0aGUgbmV3IGxvZ2ljIGlzIGhl
cmUgLSB3aHkgc2hvdWxkIGFuIGlvbWVtIApyZXNvdXJjZSBmcm9tIGEgUENJIGRldmljZSBiZSBp
Z25vcmVkPyBJdCdzIGEgY29tcGxldGVseSBzZXBhcmF0ZSBhcmVhIAp0aGF0IG1pZ2h0IG9yIG1p
Z2h0IG5vdCBiZSBlbnVtZXJhdGVkIGluIHRoZSBlODIwIHRhYmxlIC0gdGhlIG9ubHkgCnJlcXVp
cmVtZW50IHdlIGhhdmUgaGVyZSBJIHRoaW5rIGlzIHRoYXQgaXQgbm90IG92ZXJsYXAgUkFNIGFy
ZWFzIG9yIGVhY2ggCm90aGVyIChvYnZpb3VzbHkpLgoKU28gaWYgSSB1bmRlcnN0b29kIHRoaXMg
bmV3IHJlc3RyaWN0aW9uIHlvdSB3YW50IG1lbT0gdG8gaW1wbHksIGRldmljZXMgCndvdWxkIHN0
YXJ0IGZhaWxpbmcgdG8gaW5pdGlhbGl6ZSBvbiBiYXJlIG1ldGFsIHdoZW4gbWVtPSBpcyB1c2Vk
PwoKVGhhbmtzLAoKCUluZ28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
