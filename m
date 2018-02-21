From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v3 01/17] xen/arm: vpsci: Add support for
	PSCI 1.1
Date: Wed, 21 Feb 2018 08:05:50 +0000
Message-ID: <e914659e-0b51-1a2a-ce9f-49bb40ae8c62@arm.com>
References: <20180215150248.28922-1-julien.grall@arm.com>
 <20180215150248.28922-2-julien.grall@arm.com>
 <alpine.DEB.2.10.1802201637160.19448@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1802201637160.19448@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, andre.przywara@linaro.org, xen-devel@lists.xen.org, nd@arm.com, volodymyr_babchuk@epam.com, mirela.simonovic@aggios.com
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDIxLzAyLzIwMTggMDA6MzcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUaHUsIDE1IEZlYiAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEF0IHRoZSBt
b21lbnQsIFhlbiBwcm92aWRlcyB2aXJ0dWFsIFBTQ0kgaW50ZXJmYWNlIGNvbXBsaWFudCB3aXRo
IDAuMQo+PiBhbmQgMC4yLiBTaW5jZSB0aGVtLCB0aGUgc3BlY2lmaWNhdGlvbiBoYXMgYmVlbiB1
cGRhdGVkIGFuZCB0aGUgbGF0ZXN0Cj4+IHZlcnNpb24gaXMgMS4xIChzZWUgQVJNIERFTiAwMDIy
RCkuCj4+Cj4+ID5Gcm9tIGFuIGltcGxlbWVudGF0aW9uIHBvaW50IG9mIHZpZXcsIG9ubHkgUFND
SV9GRUFUVVJFUyBpcyBtYW5kYXRvcnkuCj4+IFRoZSByZXN0IGlzIG9wdGlvbmFsIGFuZCBjYW4g
YmUgbGVmdCB1bmltcGxlbWVudGVkIGZvciBub3cuCj4+Cj4+IEF0IHRoZSBzYW1lIHRpbWUsIHRo
ZSBjb21wYXRpYmxlIGZvciBQU0NJIG5vZGUgaGF2ZSBiZWVuIHVwZGF0ZWQgdG8KPj4gZXhwb3Nl
ICJhcm0scHNjaS0xLjAiLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgo+PiBBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KPj4gUmV2aWV3ZWQtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0Bl
cGFtLmNvbT4KPj4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+
PiBDYzogbWlyZWxhLnNpbW9ub3ZpY0BhZ2dpb3MuY29tCj4gCj4gVGhpcyBwYXRjaCBkb2Vzbid0
IGFwcGx5IGNsZWFubHkgdG8gc3RhZ2luZy4gQW0gSSBtaXNzaW5nIGEKPiBwcmVyZXF1aXNpdGU/
CgpJIG1lc3NlZCB1cCBteSBnaXQtZm9ybWF0IGNvbW1hbmQgYW5kIGZvcmdvdCB0byBpbmNsdWRl
ICJ4ZW4vYXJtOiBwc2NpOiAKUmV3b3JrIHRoZSBQU0NJIGRlZmluaXRpb25zIi4gSXQgd2FzIGlu
Y2x1ZGVkIGluIHYyLgoKSSB3aWxsIHJlc2VuZCB0aGUgc2VyaWVzIHdpdGggdGhlIGFjay9yZXZp
ZXdlZC1ieSBjb2xsZWN0ZWQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
