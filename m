From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2 1/2] x86: respect memory size limiting
 via mem= parameter
Date: Mon, 11 Feb 2019 13:23:08 +0100
Message-ID: <20190211122308.GA119972__30235.5142122664$1549887852$gmane$org@gmail.com>
References: <20190130082233.23840-1-jgross@suse.com>
 <20190130082233.23840-2-jgross@suse.com>
 <20190211120650.GA74879@gmail.com>
 <bd5863a2-291a-43e5-7633-c84c1026a31b@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UFNC=QS=gmail.com=mingo.kernel.org@srs-us1.protection.inumbo.net>)
 id 1gtAcE-0000qn-Im
 for xen-devel@lists.xenproject.org; Mon, 11 Feb 2019 12:23:14 +0000
Received: by mail-wm1-x343.google.com with SMTP id t200so17064170wmt.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Feb 2019 04:23:13 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <bd5863a2-291a-43e5-7633-c84c1026a31b@suse.com>
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

CiogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKCj4gPiBJZiBQQ0kgZGV2
aWNlcyBoYWQgcGh5c2ljYWwgbW1pbyBtZW1vcnkgYXJlYXMgYWJvdmUgdGhpcyByYW5nZSwgd2Un
ZCAKPiA+IHN0aWxsIGV4cGVjdCB0aGVtIHRvIHdvcmsgLSB0aGUgb3B0aW9uIHdhcyByZWFsbHkg
b25seSBtZWFudCB0byBsaW1pdCAKPiA+IFJBTS4KPiAKPiBObywgaW4gdGhpcyBjYXNlIGl0IHNl
ZW1zIHRvIGJlIHJlYWwgUkFNIGFkZGVkIHZpYSBQQ0kuIFRoZSBSQU0gaXMgCj4gaW5pdGlhbGx5
IHByZXNlbnQgaW4gdGhlIEU4MjAgbWFwLCBidXQgdGhlICJtZW09IiB3aWxsIHJlbW92ZSBpdCBm
cm9tIAo+IHRoZXJlIGFnYWluLiBEdXJpbmcgQUNQSSBzY2FuIGl0IGlzIGZvdW5kIChhZ2Fpbikg
YW5kIHdpbGwgYmUgYWRkZWQgdmlhIAo+IGhvdHBsdWcgbWVjaGFuaXNtLCBzbyAibWVtPSIgaGFz
IG5vIGVmZmVjdCBmb3IgdGhhdCBtZW1vcnkuCgpPSy4gV2l0aCB0aGF0IGJhY2tncm91bmQ6CgpB
Y2tlZC1ieTogSW5nbyBNb2xuYXIgPG1pbmdvQGtlcm5lbC5vcmc+CgpJIHN1cHBvc2UgeW91IHdh
bnQgdGhpcyB0byBnbyB1cHN0cmVhbSB2aWEgdGhlIFhlbiB0cmVlLCB3aGljaCBpcyB0aGUgCm1h
aW4gdGVzdGNhc2UgZm9yIHRoZSBidWcgdG8gYmVnaW4gd2l0aD8KClRoYW5rcywKCgluZ28KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
