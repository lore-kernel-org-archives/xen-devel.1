From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.14 020/222] x86/xen: Fix boot loader version
 reported for PVH guests
Date: Sun, 11 Nov 2018 14:21:57 -0800
Message-ID: <20181111221649.947741388@linuxfoundation.org>
References: <20181111221647.665769131@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xqpf=nw=linuxfoundation.org=gregkh@kernel.org>)
 id 1gLyH0-0001zc-6s
 for xen-devel@lists.xenproject.org; Sun, 11 Nov 2018 22:32:06 +0000
In-Reply-To: <20181111221647.665769131@linuxfoundation.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, corbet@lwn.net, Peter Zijlstra <peterz@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, stable@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, bp@alien8.de, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

NC4xNC1zdGFibGUgcmV2aWV3IHBhdGNoLiAgSWYgYW55b25lIGhhcyBhbnkgb2JqZWN0aW9ucywg
cGxlYXNlIGxldCBtZSBrbm93LgoKLS0tLS0tLS0tLS0tLS0tLS0tCgpGcm9tOiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cgpjb21taXQgMzU3ZDI5MWNlMDM1ZDFiNzU3NTY4MDU4ZjNj
OTg5OGM2MGQxMjViMSB1cHN0cmVhbS4KClRoZSBib290IGxvYWRlciB2ZXJzaW9uIHJlcG9ydGVk
IHZpYSBzeXNmcyBpcyB3cm9uZyBpbiBjYXNlIG9mIHRoZQprZXJuZWwgYmVpbmcgYm9vdGVkIHZp
YSB0aGUgWGVuIFBWSCBib290IGVudHJ5LiBpdCBzaG91bGQgYmUgMi4xMgooMHgwMjBjKSwgYnV0
IGl0IGlzIHJlcG9ydGVkIHRvIGJlIDIuMTggKDB4MDIxMikuCgpBcyB0aGUgY3VycmVudCB3YXkg
dG8gc2V0IHRoZSB2ZXJzaW9uIGlzIGVycm9yIHByb25lIHVzZSB0aGUgbW9yZQpyZWFkYWJsZSB2
YXJpYW50ICgyIDw8IDgpIHwgMTIuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+CkNjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyA0LjEyCkNjOiBMaW51
cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBQZXRlciBaaWps
c3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+CkNjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGlu
dXRyb25peC5kZT4KQ2M6IGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tCkNjOiBicEBhbGllbjgu
ZGUKQ2M6IGNvcmJldEBsd24ubmV0CkNjOiBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnCkNjOiB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKTGluazogaHR0cDovL2xrbWwua2VybmVsLm9y
Zy9yLzIwMTgxMDEwMDYxNDU2LjIyMjM4LTItamdyb3NzQHN1c2UuY29tClNpZ25lZC1vZmYtYnk6
IEluZ28gTW9sbmFyIDxtaW5nb0BrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2Fo
LUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgoKLS0tCiBhcmNoL3g4Ni94ZW4v
ZW5saWdodGVuX3B2aC5jIHwgICAgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgotLS0gYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2aC5jCisrKyBi
L2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHZoLmMKQEAgLTc2LDcgKzc2LDcgQEAgc3RhdGljIHZv
aWQgX19pbml0IGluaXRfcHZoX2Jvb3RwYXJhbXModgogCSAqIFZlcnNpb24gMi4xMiBzdXBwb3J0
cyBYZW4gZW50cnkgcG9pbnQgYnV0IHdlIHdpbGwgdXNlIGRlZmF1bHQgeDg2L1BDCiAJICogZW52
aXJvbm1lbnQgKGkuZS4gaGFyZHdhcmVfc3ViYXJjaCAwKS4KIAkgKi8KLQlwdmhfYm9vdHBhcmFt
cy5oZHIudmVyc2lvbiA9IDB4MjEyOworCXB2aF9ib290cGFyYW1zLmhkci52ZXJzaW9uID0gKDIg
PDwgOCkgfCAxMjsKIAlwdmhfYm9vdHBhcmFtcy5oZHIudHlwZV9vZl9sb2FkZXIgPSAoOSA8PCA0
KSB8IDA7IC8qIFhlbiBsb2FkZXIgKi8KIH0KIAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
