From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 0/2] xen: fix two issues in Xen pv qspinlock
 handling
Date: Tue, 9 Oct 2018 16:52:28 +0200
Message-ID: <53dc092d-a09c-beb4-f81f-399286da0ecd__11050.0686023899$1539096683$gmane$org@suse.com>
References: <20181001071641.19282-1-jgross@suse.com>
 <762802a4b8ff21e43e59e222e472ab9b23fc43cd.camel@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=nckf=mv=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g9tNB-0005qx-QE
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 14:52:33 +0000
In-Reply-To: <762802a4b8ff21e43e59e222e472ab9b23fc43cd.camel@infradead.org>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: Waiman.Long@hp.com, peterz@infradead.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMTAvMjAxOCAxNjo0MCwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIE1vbiwgMjAx
OC0xMC0wMSBhdCAwOToxNiArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gVGhlIFhlbiBz
cGVjaWZpYyBxdWV1ZSBzcGlubG9jayB3YWl0IGZ1bmN0aW9uIGhhcyB0d28gaXNzdWVzIHdoaWNo
Cj4+IGNvdWxkIHJlc3VsdCBpbiBhIGhhbmdpbmcgc3lzdGVtLgo+Pgo+PiBUaGV5IGhhdmUgYSBz
aW1pbGFyIHJvb3QgY2F1c2Ugb2YgY2xlYXJpbmcgYSBwZW5kaW5nIHdha2V1cCBvZiBhCj4+IHdh
aXRpbmcgdmNwdSBhbmQgbGF0ZXIgZ29pbmcgdG8gc2xlZXAgd2FpdGluZyBmb3IgdGhlIGp1c3Qg
Y2xlYXJlZAo+PiB3YWtldXAgZXZlbnQsIHdoaWNoIG9mIGNvdXJzZSB3b24ndCBldmVyIGhhcHBl
bi4KPj4KPj4gSnVlcmdlbiBHcm9zcyAoMik6Cj4+ICAgeGVuOiBmaXggcmFjZSBpbiB4ZW5fcWxv
Y2tfd2FpdCgpCj4+ICAgeGVuOiBtYWtlIHhlbl9xbG9ja193YWl0KCkgbmVzdGFibGUKPj4KPj4g
IGFyY2gveDg2L3hlbi9zcGlubG9jay5jIHwgMzMgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25z
KC0pCj4+Cj4+IENjOiBXYWltYW4uTG9uZ0BocC5jb20KPj4gQ2M6IHBldGVyekBpbmZyYWRlYWQu
b3JnCj4gCj4gTEdUTS4gQm90aCB0aGVzZSBzaG91bGQgYmUgQ2M6c3RhYmxlQHZnZXIua2VybmVs
Lm9yZywgeWVzPwoKWWVzLCB0aGV5IGFyZS4KCkkgaGF2ZSB0aGVtIGFscmVhZHkgcXVldWVkIGlu
IHRoZSBYZW4gdHJlZS4gQXMgdGhlIGJ1ZyBpcyByYXRoZXIKb2xkIEkgZGlkbid0IHdhbnQgdG8g
cnVzaCB0aGUgcGF0Y2hlcyBpbiBzbyBsYXRlIGluIHRoZSByYyBwaGFzZSBvZgo0LjE5LgoKCkp1
ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
