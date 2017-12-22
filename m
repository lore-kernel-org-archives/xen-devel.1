From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] x86/svm: Add checks for nested HW
	features
Date: Fri, 22 Dec 2017 15:15:48 +0000
Message-ID: <8eb9d4df-e911-c213-4c32-dd20a54d0728@citrix.com>
References: <20171221152619.38079-1-brian.woods@amd.com>
 <20171221152619.38079-3-brian.woods@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20171221152619.38079-3-brian.woods@amd.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Brian Woods <brian.woods@amd.com>, xen-devel@lists.xen.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan Beulich <jbeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjEvMTIvMTcgMTU6MjYsIEJyaWFuIFdvb2RzIHdyb3RlOgo+IEFkZCBhIG5lc3RlZGh2bV9l
bmFibGUoKSBjaGVjayB0byB0aGUgZXhpc3RpbmcgY2hlY2tzIGZvciBzZXR0aW5nIHRoZQo+IHZp
cnR1YWwgR0lGIGFuZCB2aXJ0dWFsIFZNTE9BRC9WTVNBVkUgZmVhdHVyZXMuICBJZiBpdCBpc24n
dCBhIG5lc3RlZGh2bQo+IGd1ZXN0LCBkbyBub3QgZW5hYmxlIHRoZSBmZWF0dXJlcyBpbiB0aGUg
Vk1DQi4KPgo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29t
PgoKVW5mb3J0dW5hdGVseSwgbmVzdGVkaHZtX2VuYWJsZWQoKSBpcyBndWFyYW50ZWVkIHRvIGJl
IGZhbHNlIGF0IHRoZQpwb2ludCB0aGF0IGNvbnN0cnVjdF92bWNiKCkgaXMgY2FsbGVkIChkdWUg
dGhlIG9yZGVyIGluIHdoaWNoCmluZm9ybWF0aW9uIGFwcGVhcnMgd2hpbGUgY29uc3RydWN0aW5n
IHRoZSBWTSksIHdoaWNoIG1lYW5zIHdlIHdpbGwKbmV2ZXIgZW5hYmxlIHRoZXNlIG9wdGltaXNh
dGlvbnMuCgpDb21iaW5lZCB3aXRoIHRoZSBvYnNlcnZhdGlvbiBvZiBFRkVSIGluIHRoZSBwaXBl
bGluZSwgdGhlIGxvZ2ljIHRvCmVuYWJsZS9kaXNhYmxlIHRoZXNlIG9wdGltaXNhdGlvbnMgbmVl
ZHMgdG8gYmUgaW4Kc3ZtX3VwZGF0ZV9ndWVzdF9lZmVyKCksIGFuZCBuZWVkIHRvIHRyaWdnZXIg
d2hlbiBFRkVSLlNWTUUgY2hhbmdlcy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
