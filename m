From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/2] x86: respect memory size limiting
 via mem= parameter
Date: Mon, 11 Feb 2019 13:35:16 +0100
Message-ID: <39e8f05b-868b-8ab7-a310-b4ea7ef92bcc__3058.88936143077$1549888573$gmane$org@suse.com>
References: <20190130082233.23840-1-jgross@suse.com>
 <20190130082233.23840-2-jgross@suse.com> <20190211120650.GA74879@gmail.com>
 <bd5863a2-291a-43e5-7633-c84c1026a31b@suse.com>
 <20190211122308.GA119972@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3PTQ=QS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gtAnx-0001vG-69
 for xen-devel@lists.xenproject.org; Mon, 11 Feb 2019 12:35:21 +0000
In-Reply-To: <20190211122308.GA119972@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: sstabellini@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDIvMjAxOSAxMzoyMywgSW5nbyBNb2xuYXIgd3JvdGU6Cj4gCj4gKiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+IAo+Pj4gSWYgUENJIGRldmljZXMgaGFkIHBo
eXNpY2FsIG1taW8gbWVtb3J5IGFyZWFzIGFib3ZlIHRoaXMgcmFuZ2UsIHdlJ2QgCj4+PiBzdGls
bCBleHBlY3QgdGhlbSB0byB3b3JrIC0gdGhlIG9wdGlvbiB3YXMgcmVhbGx5IG9ubHkgbWVhbnQg
dG8gbGltaXQgCj4+PiBSQU0uCj4+Cj4+IE5vLCBpbiB0aGlzIGNhc2UgaXQgc2VlbXMgdG8gYmUg
cmVhbCBSQU0gYWRkZWQgdmlhIFBDSS4gVGhlIFJBTSBpcyAKPj4gaW5pdGlhbGx5IHByZXNlbnQg
aW4gdGhlIEU4MjAgbWFwLCBidXQgdGhlICJtZW09IiB3aWxsIHJlbW92ZSBpdCBmcm9tIAo+PiB0
aGVyZSBhZ2Fpbi4gRHVyaW5nIEFDUEkgc2NhbiBpdCBpcyBmb3VuZCAoYWdhaW4pIGFuZCB3aWxs
IGJlIGFkZGVkIHZpYSAKPj4gaG90cGx1ZyBtZWNoYW5pc20sIHNvICJtZW09IiBoYXMgbm8gZWZm
ZWN0IGZvciB0aGF0IG1lbW9yeS4KPiAKPiBPSy4gV2l0aCB0aGF0IGJhY2tncm91bmQ6Cj4gCj4g
QWNrZWQtYnk6IEluZ28gTW9sbmFyIDxtaW5nb0BrZXJuZWwub3JnPgo+IAo+IEkgc3VwcG9zZSB5
b3Ugd2FudCB0aGlzIHRvIGdvIHVwc3RyZWFtIHZpYSB0aGUgWGVuIHRyZWUsIHdoaWNoIGlzIHRo
ZSAKPiBtYWluIHRlc3RjYXNlIGZvciB0aGUgYnVnIHRvIGJlZ2luIHdpdGg/CgpZZXMsIEknZCBw
cmVmZXIgdGhhdC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
