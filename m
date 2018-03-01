From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/7] xen/iommu: smmu-v3: Add Xen specific
 code to enable the ported driver
Date: Thu, 01 Mar 2018 08:38:37 -0700
Message-ID: <5A982C8D02000078001AD71E@prv-mh.provo.novell.com>
References: <20180209031055.21926-1-sameer.goel@linaro.org>
 <20180209031055.21926-6-sameer.goel@linaro.org>
 <24bed3b5-9951-fb85-f5f8-1e295d565994@arm.com>
 <5A981A6802000078001AD629@prv-mh.provo.novell.com>
 <82611124-3baa-1b56-3c8c-38dca15fb56c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ib05=fx=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1erQIC-0004pt-0U
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 15:38:48 +0000
In-Reply-To: <82611124-3baa-1b56-3c8c-38dca15fb56c@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Sameer Goel <sameer.goel@linaro.org>
Cc: sstabellini@kernel.org, Wei Liu <wei.liu2@citrix.com>, mjaggi@caviumnetworks.com, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org, shankerd@codeaurora.org, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjAzLjE4IGF0IDE1OjMzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IFdoYXQgU2FtZWVyIGhhcyBiZWVuIGRvaW5nIGZvciBTTU1VdjMgaXMgZm9sbG93aW5nIHRoZSB3
b3JkIHdlIGRpZCBvbiAKPiB0aGUgQVJNIFNNTVV2MiBkcml2ZXIuIFRoZSBoZWFkZXIgaXMgYSBz
dWdnZXN0aW9uIGZvciBjb25zb2xpZGF0aW5nIHRoZSAKPiBtYWNyb3Mgb3ZlciB0aGUgZmlsZXMg
aGVyZS4KCkluIHdoaWNoIGNhc2UgLSB3aHkgaXNuJ3QgdGhlIHBhdGNoIGludHJvZHVjaW5nIHRo
aXMgY29tcGF0IGhlYWRlcgpyZW1vdmluZyB0aGUgZXF1aXZhbGVudCBzdHVmZiBmcm9tIHRoYXQg
b3RoZXIgZmlsZS4gSW5zdGVhZCBpdCBnb2VzCmFuZCBpbnRyb2R1Y2VzIHRoZSBuZXcgc21tdS12
My5jIHJpZ2h0IGhlcmUuIElmIGl0IHdhcyBtb3JlIHZpc2libGUKd2hhdCBjb2RlIGlzIG1lcmVs
eSBtb3ZlZCwgaXQgbWlnaHQgYmUgZWFzaWVyIHRvIGFncmVlIHRvIHRoZQppbnRyb2R1Y3Rpb24u
CgpPdG9oIHRoaXMgaXMgc3RpbGwgYWxsIHZlcnkgQVJNIElPTU1VIHNwZWNpZmljIC0gcGVyaGFw
cyB0aGUgaGVhZGVyCndvdWxkIHRoZW4gYmV0dGVyIGJlIGxvY2FsIHRvIHhlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FybS8gKGFuZAp5b3Ugd29uJ3Qgc2VlIG1lIGNvbXBsYWluIGFib3V0IGFsbCB0
aGlzIHJhbmRvbSBzdHVmZiBhbnltb3JlKT8KCj4gT3ZlcmFsbCBJIHRoaW5rIGl0IG1ha2VzIHNl
bnNlIHRvIGtlZXAgIkxpbnV4IHdvcmRpbmciIGFzIG11Y2ggYXMgCj4gcG9zc2libGUgYmVjYXVz
ZSB0aG9zZSBmaWxlcyBhcmUgdXNpbmcgTGludXggcGhpbG9zb3BoeS4gQnV0IEkgd291bGQgYmUg
Cj4gb3BlbiB0byBzdWdnZXN0aW9uIGhlcmUuIFNvIHdvdWxkIHlvdSBtaW5kIGdpdmluZyBhIGxp
c3Qgb2YgdGhpbmdzIHlvdSAKPiBjb25zaWRlciAiYmFzaWMgYXNwZWN0cyB0byAnWGVuIHdvcmRp
bmcnIj8KCi0gYXMgYWxyZWFkeSBzYWlkLCBhbnl0aGluZyBnZnAtaXNoCi0gZW51bSBpcnFyZXR1
cm4sIGFuZCBpbiBwYXJ0aWN1bGFyIElSUV9XQUtFX1RIUkVBRCwgdGhlCiAgc2VtYW50aWNzIG9m
IHdoaWNoIHN1cmVseSBhcmVuJ3QgbWF0Y2hlZCBpbiBYZW4KCk90b2ggSSdtIGhhdmluZyBsZXNz
IG9mIGEgcHJvYmxlbSB3aXRoIGUuZy4gZGV2X3ByaW50aygpIGFuZCBmcmllbmRzCm9yIGt0aW1l
X3QgZXQgYWwsIGV2ZW4gaWYgSSB3b3VsZCBwcmVmZXIgdGhlbSB0byBub3QgYXBwZWFyLgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
