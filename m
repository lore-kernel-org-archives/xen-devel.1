From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/xen: Calculate __max_logical_packages
	on PV domains
Date: Mon, 12 Feb 2018 14:51:18 +0100
Message-ID: <73fb2eb7-961a-6984-deb7-4efe5ed03a7c__20490.010691765$1518443463$gmane$org@suse.com>
References: <20180207234923.13544-1-prarit@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wvyf=fg=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1elEW1-0005xh-Nr
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2018 13:51:29 +0000
In-Reply-To: <20180207234923.13544-1-prarit@redhat.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Prarit Bhargava <prarit@redhat.com>, linux-kernel@vger.kernel.org
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Dou Liyang <douly.fnst@cn.fujitsu.com>, Andi Kleen <ak@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, x86@kernel.org, Vitaly Kuznetsov <vkuznets@redhat.com>, Ingo Molnar <mingo@redhat.com>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDIvMTggMDA6NDksIFByYXJpdCBCaGFyZ2F2YSB3cm90ZToKPiBUaGUga2VybmVsIHBh
bmljcyBvbiBQViBkb21haW5zIGJlY2F1c2UgbmF0aXZlX3NtcF9jcHVzX2RvbmUoKSBpcwo+IG9u
bHkgY2FsbGVkIGZvciBIVk0gZG9tYWlucy4KPiAKPiBDYWxjdWxhdGUgX19tYXhfbG9naWNhbF9w
YWNrYWdlcyBmb3IgUFYgZG9tYWlucy4KPiAKPiBGaXhlczogYjRjMGE3MzI2ZjVkICgieDg2L3Nt
cGJvb3Q6IEZpeCBfX21heF9sb2dpY2FsX3BhY2thZ2VzIGVzdGltYXRlIikKPiBTaWduZWQtb2Zm
LWJ5OiBQcmFyaXQgQmhhcmdhdmEgPHByYXJpdEByZWRoYXQuY29tPgo+IFRlc3RlZC1hbmQtcmVw
b3J0ZWQtYnk6IFNpbW9uIEdhaXNlciA8c2ltb25AaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KPiBD
YzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gQ2M6IEluZ28gTW9sbmFy
IDxtaW5nb0ByZWRoYXQuY29tPgo+IENjOiAiSC4gUGV0ZXIgQW52aW4iIDxocGFAenl0b3IuY29t
Pgo+IENjOiB4ODZAa2VybmVsLm9yZwo+IENjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJv
dnNreUBvcmFjbGUuY29tPgo+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4g
Q2M6IERvdSBMaXlhbmcgPGRvdWx5LmZuc3RAY24uZnVqaXRzdS5jb20+Cj4gQ2M6IFByYXJpdCBC
aGFyZ2F2YSA8cHJhcml0QHJlZGhhdC5jb20+Cj4gQ2M6IEthdGUgU3Rld2FydCA8a3N0ZXdhcnRA
bGludXhmb3VuZGF0aW9uLm9yZz4KPiBDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZz4KPiBDYzogQW5keSBMdXRvbWlyc2tpIDxsdXRvQGtlcm5lbC5vcmc+
Cj4gQ2M6IEFuZGkgS2xlZW4gPGFrQGxpbnV4LmludGVsLmNvbT4KPiBDYzogVml0YWx5IEt1em5l
dHNvdiA8dmt1em5ldHNAcmVkaGF0LmNvbT4KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCgpDb21taXR0ZWQgdG8geGVuLnRpcCBmb3ItbGludXMtNC4xNgoKCkp1ZXJnZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
