From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] x86/SVM-IOMMU: Don't opencode memcpy()
 in queue_iommu_command()
Date: Mon, 24 Sep 2018 06:32:20 -0600
Message-ID: <5BA8D95402000078001EB255@prv1-mh.provo.novell.com>
References: <1537786530-4625-1-git-send-email-andrew.cooper3@citrix.com>
 <930ae0cb767d46898ea4a9acdb95c2be@AMSPEX02CL03.citrite.net>
 <bb08f184-1861-a75b-9479-26771116ec9c@citrix.com>
 <83196ca8ba4740f891892a50f2aaeb9d@AMSPEX02CL03.citrite.net>
 <5BA8D59002000078001EB203@prv1-mh.provo.novell.com>
 <5fb496fa9dd947039631a3520fda7d6c@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5fb496fa9dd947039631a3520fda7d6c@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA5LjE4IGF0IDE0OjE4LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAyNCBTZXB0ZW1iZXIgMjAxOCAxMzoxNgo+PiAKPj4gQWxsIHdyaXRlcyB0byB0aGUgcmluZyBv
Y2N1ciBzdHJpY3RseSBiZWZvcmUgdGhlIHVwZGF0ZSBvZiB0aGUgdGFpbAo+PiBwb2ludGVyCj4g
Cj4gLi4udW5sZXNzIHRoZSBjb21waWxlciBkZWNpZGVzIHRvIHJlLW9yZGVyLiBUaGVyZSdzIG5v
IGJhcnJpZXIuCgpCdXQgdGhlcmUgaXMgKGFuIGltcGxpZWQpIG9uZSwgaW5zaWRlIHdyaXRlbCgp
IChkdWUgdG8gdGhlICJ2b2xhdGlsZSIpLgpFdmVyeXRoaW5nIGFoZWFkIG9mIHRoZSB3cml0ZWwo
KSBpbnZvY2F0aW9uIG1heSBiZSBzdG9yZWQgaW4gYW55Cm9yZGVyLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
