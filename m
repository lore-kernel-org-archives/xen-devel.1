From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [ATTN SVM maintainers] Re: [PATCH V6] x86/hvm: fix
 domain crash when CR3 has the noflush bit set
Date: Wed, 28 Feb 2018 12:54:59 -0500
Message-ID: <a51d4451-3808-eff9-d5c3-2b93b5114569@oracle.com>
References: <1519814295-3211-1-git-send-email-rcojocaru@bitdefender.com>
 <1cf3e62a-c250-b340-b72d-2f4eaceec834@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1cf3e62a-c250-b340-b72d-2f4eaceec834@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xen.org
Cc: kevin.tian@intel.com, tamas@tklengyel.com, suravee.suthikulpanit@amd.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, tim@xen.org, jbeulich@suse.com, jun.nakajima@intel.com
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjgvMjAxOCAxMjoxMiBQTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAwMi8yOC8y
MDE4IDEwOjM4IEFNLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4+IEluIGhhcmR3YXJlLCB3aGVu
IFBDSUQgc3VwcG9ydCBpcyBlbmFibGVkIGFuZCB0aGUgTk9GTFVTSCBiaXQgaXMgc2V0Cj4+IHdo
ZW4gd3JpdGluZyBhIENSMyB2YWx1ZSwgdGhlIGhhcmR3YXJlIHdpbGwgY2xlYXIgdGhhdCB0aGF0
IGJpdCBhbmQKPj4gY2hhbmdlIHRoZSBDUjMgd2l0aG91dCBmbHVzaGluZyB0aGUgVExCLiBodm1f
c2V0X2NyMygpLCBob3dldmVyLCB3YXMKPj4gaWdub3JpbmcgdGhpcyBiaXQ7IHRoZSByZXN1bHQg
d2FzIHRoYXQgcG9zdC12bV9ldmVudCBjaGVja3MgZGV0ZWN0ZWQKPj4gYW4gaW52YWxpZCBDUjMg
dmFsdWUgYW5kIGNyYXNoZWQgdGhlIGRvbWFpbi4KPj4KPj4gSGFuZGxlIE5PRkxVU0ggaW4gaHZt
X3NldF9jcjMoKSBieToKPj4gMS4gQ2xlYXJpbmcgdGhlIGJpdAo+PiAyLiBQYXNzaW5nIGEgIm5v
Zmx1c2giIGZsYWcgdG8gbG93ZXItbGV2ZWwgY3IzIHNldHRpbmcgZnVuY3Rpb25zIHRvCj4+IGlu
ZGljYXRlIHRoYXQgYSBmbHVzaCBzaG91bGQgbm90IGJlIHBlcmZvcm1lZC4KPj4KPj4gQWxzbyBj
bGVhciBYODZfQ1IzX05PRkxVU0ggd2hlbiByZXBvcnRpbmcgQ1IzIG1vbml0b3JlZCBDUjMgd3Jp
dGVzLgo+Pgo+PiBUaGlzIGFsbG93cyBpbnRyb3NwZWN0aW9uIHRvIGJlIHVzZWQgb24gVk1zIHdo
b3NlIG9wZXJhdGluZyBzeXN0ZW0gdXNlcwo+PiB0aGUgTk9GTFVTSCBiaXQuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KPj4g
UmVwb3J0ZWQtYnk6IEJpdHdlYXNpbCA8Yml0d2Vhc2lsQGNyeXB0b2hhemUuY29tPgo+PiBTdWdn
ZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+IEFj
a2VkLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4+IFJldmlld2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IFJldmlld2VkLWJ5OiBLZXZp
biBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KPj4gQWNrZWQtYnk6IEdlb3JnZSBEdW5sYXAg
PGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KPiBCb3JpcyAvIFN1dmFyZWUsIGFueSBvcGluaW9u
cyBvbiB0aGUgU1ZNIGNoYW5nZXM/Cj4KCgpSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxi
b3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
