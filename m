Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FBCC9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 14:45:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430829.1653278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9ODy-0001qk-H1; Wed, 23 Sep 2026 14:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430829.1653278; Wed, 23 Sep 2026 14:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9ODy-0001qd-ER; Wed, 23 Sep 2026 14:45:30 +0000
Received: by outflank-mailman (input) for mailman id 1430829;
 Wed, 23 Sep 2026 14:45:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x9ODX-0001mR-1v
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 14:45:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9ODW-00Bfa8-Ep
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 16:45:02 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 6ab3e5e4-e002-0a2a0a5209dd-0a2a4506ce5a-20
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 16:45:02 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 6ab3e5ec-195a-0a2a45060019-cddcb483cbc8-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 16:45:01 +0200
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NBbe8Z3414040
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 14:45:00 GMT
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n2hjt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 14:44:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-33c35f5ca6cso1574614eec.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 07:44:59 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33e95c7d003sm6415514eec.9.2026.09.23.07.44.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 07:44:57 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=qcppdkim1 header.d=qualcomm.com header.i="@qualcomm.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=google header.d=oss.qualcomm.com header.i="@oss.qualcomm.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:From:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xgcOxoTBwTC0LF6Ccg2RoIG8nDW44o8mbEkBphCt1MQ=; b=lOcvg0LsZNHlJQcO
	83LWdgPgFbriVuwgIkvY1vjmlk3l0vvKq5h3c+UrBHs4eH8sUgVxSQO6/x7k7sWA
	XP9VHPwASEyTQBgKxgTVA9Qzh/Vpa4KV1F4MZcTE87LSY2YKrDyZxAD8y5rRIfqa
	0kZU1HHHHdP/tG9icKbXa+XeoO4Jnpmc1tO0ArX+MMrLhxHJ3rUnkD1MyDAzuBv5
	9e5urHMujrRvNlDJiuAx6R8rvM2q5XTIGwwp1wVaN23cB7UDJHJsv1g71ZijmXKP
	XizyejcqWjeG+hvuHg6+K8yMo852eB23u3BBgBaJ7+oAj83v3/xibK+Ja8JUaYxN
	NXqUZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790174699; x=1790779499; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xgcOxoTBwTC0LF6Ccg2RoIG8nDW44o8mbEkBphCt1MQ=;
        b=Yy9FGKap78gcdGmSZmZFoAbo8FWMsMVRUVrasSpCG0u7nfcvsNCw0uMMnn6t/1typ6
         4XTS9lY+a2cASzTYF+5gFJ7B3kgE+0cZ0DDJnXK46S9FKFeY76muor4S9psJ1CoOWbC6
         4jr7WUDfi5pdZ1n+w8FRCRIAB9lyCjX1ubmuBMDy5Ar8pO5hpFkE6RSy8RrQsho9BPPu
         nzOY9hY5ApEWIuR54oZ99opm1+iXQRb2qEecHSqV1nFFwc0jrCoZycIXZnClVZ8Zz7kc
         U3uWywVsDoznHNJPKcv5KTRB2a4gJKxJnHcxJ4hV19MGf9rLs6aB/3bCFfvUe4kuplwY
         Regg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174699; x=1790779499;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgcOxoTBwTC0LF6Ccg2RoIG8nDW44o8mbEkBphCt1MQ=;
        b=zWW8wBaVnep6+FlfXk6BJX2GsT+UsHOhFkgKn0uWkA51u3dCYGEN1rl15/KQQf8iBV
         PTxNsHvUozoV5GS7kjSWZ4QP5ymGQK+WRECU6roOsKy9yM/EzENz0UVe4Yw0vicG97CG
         XQuoNxY8Eh0C8is6bFa7NKQN7v3LIFo0IufxgM4G/pN+rg/We0cAl2q1wmwE43+NbmIa
         3FJet9I3NyoJRieCi+4fDNVuoqjHbzP1z72X+QTHW5KHqAC1AKJSCyU9DYzZbjal9+Aw
         7XXHMAOmI+BgYYghuy5VFvp49QT6W9sOuhpaaOPGu9PpLtXGOV5xFfZWaDK27oaeYgPL
         GdOw==
X-Forwarded-Encrypted: i=1; AKwUvBz6rTwy7SisUUoS9y9j4F9iEh6gmsuPBZzDvpxsCgeUulMpj+9eglEwQwq4VWeOAR9Jq6JC8cZdwMk=@lists.xenproject.org
X-Gm-Message-State: AFuF++kzxih2nZrltgm/RAl9cuw2XKRgnpo3QOhjsTNnVBQlUKpX6ohm
	7FXYH11Y9A1uvFOoBpoaC5WpudgVASrGlP+eNrWC/lPyzzDAoyRB4GyEHvGqo2x2s3ljHhR2gkh
	x/+k2hMJkHgTl5nxlQpnubevCnjl1n4lJafW1dWeLigl9F5K1HM2lV/CjaT4tjK+onvN7Gg==
X-Gm-Gg: AYBFou0G07OJKTIgc0HyLuppcDIxoDMWn6aymkM+7xcwiiL5JjVcxVauSpORAEDSMJe
	DE/Nn9g4QpaSohfBFADzChEZIkGkExM/MNT+UuKLjn/hgiMGTJUDKeXbzTxtt+adagcjevcWp5g
	7M5gsoPCaza21Ym1Ku88YMfYfEpNaHC4W9L7p0uHX5e52TfXbNSfcYF6oiljTLRAp/sXL8Viexa
	kQEAD14gR+zQ7W5JIoaekxEQbeQxxOaPJPRxVG9+6CvBfV2zBoGs1f3AxJvzrsV86gbVk9mP2H4
	InoSF6riHJj9QFbzZPyd8Ow4TWaFsSDCNxZ2qQNmuW4btvlGvHrdpyS5ViUmieoie9+3+Os6qmw
	h4q6DvTTwLBxQHBLwOOUxNQZdOS4dVsEu27fjhHngHjcJ16ZFEE8Iswpuc2vFJ+7m0TIxU3DAso
	5beg==
X-Received: by 2002:a05:693c:42d9:b0:33b:e75b:cc42 with SMTP id 5a478bee46e88-33e8d7d8b7bmr2233687eec.19.1790174698776;
        Wed, 23 Sep 2026 07:44:58 -0700 (PDT)
X-Received: by 2002:a05:693c:42d9:b0:33b:e75b:cc42 with SMTP id 5a478bee46e88-33e8d7d8b7bmr2233634eec.19.1790174698038;
        Wed, 23 Sep 2026 07:44:58 -0700 (PDT)
Message-ID: <fb2fbd8a-f362-49a9-836f-7ad271454578@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 07:44:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 000/114] single-binary: link multi-targets into
 qemu-system
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, xen-devel@lists.xenproject.org,
        Chao Liu <chao.liu@processmission.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
        Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
        Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Fabiano Rosas <farosas@suse.de>,
        Xianglai Li <lixianglai@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Max Filippov <jcmvbkbc@gmail.com>, qemu-ppc@nongnu.org,
        Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
        Bibo Mao <maobibo@loongson.cn>, "Michael S. Tsirkin" <mst@redhat.com>,
        Laurent Vivier <laurent@vivier.eu>,
        David Hildenbrand <david@kernel.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
        Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
        kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Stafford Horne <shorne@gmail.com>,
        =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
        Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
        Song Gao <17746591750@163.com>, qemu-arm@nongnu.org,
        qemu-s390x@nongnu.org, Brian Cain <brian.cain@oss.qualcomm.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfX7qciuBdI2AZe
 CyQdDPF6tWBOvVcsURzYw6uaBqLi422VAE+kfitP915rFHXXqMUqWdEOnS9uxi4dAlOENzj/s/G
 pmbCydFZty0kzrnBUGkRrIymuuzlSCs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfXzP1tBP0J6BmX
 cp805b3Nnss6X0aFkLA7OzibBKMzAh/pPEbvMJrvUcV8pwFsITZIi+eV8d1DSiEAzos0t/riHzY
 KA4VfbwmfPzpw4dsF+tyoOgz9P5RXf2Vr8vGim2izF7A1ibfQESTXeqKj6JRFHueoAaYkVSMJTt
 mNsTLdfavipFP09uSleJFPitjUEOQSriog9s5wLN3ECkNiLYefampacej/W3wpEBsMSAq1jQIQO
 fsDOLNeU6aVNBpdD6P87DGwJWN8yp5fLhqGpynOvMXV/q2RPFTTf51QjwkCRiTjbZMgLjgmLqt+
 rKLg5MYc971MUZVJwqBfV79oy4aejBBrEb1xrSumBtbMrmzpcOfaSgbbENuVKVkAzGcseK3Nke7
 o5XFOBuS+cydAXYjni34nLKcIm8dysqMiUcomhrthTwy/iWIThPUxHHeF6vVXeeDEKbmFdKlEr3
 Gb8IsrMXfwbWyzl6IfA==
X-Proofpoint-ORIG-GUID: ktz--GUWAF66OazTJM_CVqPl5K17F19f
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3e5ec cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=GaQpPoNlAAAA:8 a=pGLkceISAAAA:8 a=p0WdMEafAAAA:8 a=GSDOiBCUhkFbxXud944A:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=xF5q_uoM5gZT5J3czcBi:22
X-Proofpoint-GUID: ktz--GUWAF66OazTJM_CVqPl5K17F19f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230058
X-purgate-ID: tlsNG-16d1c6/1790174702-FD20877B-F4A72336/0/0
X-purgate-type: clean
X-purgate-size: 4830

Hi Yonggang,

On 9/23/2026 6:14 AM, Yonggang Luo wrote:
> This series produces one qemu-system binary that can run ARM (32 and
> 64), RISC-V (32 and 64), and MicroBlaze.
> Upstream filters machines with TypeInfo.is_available. This series
> passes a TargetInfo into that callback, uniquifies QOM names that
> collide in one process, and compiles those targets once so they can
> share qemu-system.
> 
> A combined link cannot keep C symbols or QOM type names that were
> unique only because each qemu-system-$arch was a separate binary.
> These patches remove those collisions:
> 
> - TYPE_ACCEL_CPU is the fixed abstract type accel-cpu, registered
>   once next to TYPE_ACCEL. Leaf names still encode the CPU type so
>   accel_init_cpu_interfaces() can look up "<accel>-" plus
>   target_cpu_type() (tcg-accel-arm-cpu).
> - virt QOM names are prefixed: arm-virt, riscv-virt, and the same
>   for or1k, hexagon, loongarch, m68k, and xtensa. Boards keep
>   -machine virt via machine_class_set_name(). query-machines returns
>   the QOM type in MachineInfo typename.
> - virt ACPI helpers and RISC-V TCG crc32/crc32c/wfi helpers get an
>   arch prefix so the combined link does not need meson -D name
>   mangling. LoongArch virt_acpi_setup is renamed in the same pass.
> 
> Target selection has to work with more than one TargetInfo:
> 
> - The combined binary takes arch:name on -M/-machine and in a
>   [machine] type (aarch64:virt). arch: binds the target. microblaze:
>   runs that target's default machine. arm, aarch64, riscv32, and
>   riscv64 have no default. No -M leaves target none and the empty
>   none machine. qemu-system-$arch keeps the historic -M name.
>   -M help lists every target; arch:help lists one. query-targets
>   lists each linked target, including none.
> - TargetInfo is a constructor list. target_info_select() picks the
>   entry, including SYS_EMU_TARGET_NONE. is_available takes const
>   TargetInfo *. While the target is still none, QOM skips the
>   unavailable filter so grouped -M help can list every machine.
> - query-cpu-definitions, dump notes, and Angel semihosting sit on
>   TargetCpuOps indexed by target_arch(). Registration uses a
>   QEMU_ARCH_* bitmask so one object can fill ARM and AARCH64. The
>   table is target-ops.h / target-ops.c.
> 
> qemu-system-$TARGET is still built, including the Windows *w twin.
> qemu-system is extra. It links each target whose arch sources are
> only target-info-def.c: arm, aarch64, riscv32, riscv64, and
> microblaze. Do not add qemu-systemw for that binary. A GUI
> twin would keep QEMU exporting data from the .exe into DLLs, and
> those data exports cannot be delay-loaded (qdev_prop_array and
> other qdev_prop_*). That would block enabling modules globally on
> Windows.
> 
> Examples:
> 
>   qemu-system -M aarch64:virt ...
>   qemu-system -M microblaze:petalogix-s3adsp1800 ...
>   qemu-system-riscv64 -M virt ...
> 
> A bare machine name on qemu-system needs an arch: prefix. An unknown
> target fails with "target '...' is not available".
> 
> Prerequisites:
>   [PATCH v2 0/9] machine: uniquify virt QOM names
>   https://patchew.org/QEMU/20260922215533.641-1-luoyonggang@gmail.com/
>   [PATCH 00/21] accel/tcg: share raise_excp across TCG targets
>   https://patchew.org/QEMU/20260918004225.827-1-luoyonggang@gmail.com/
>   [PATCH v5 00/11] single-binary: Compile hw/riscv once
>   https://patchew.org/QEMU/20260918-hw-riscv-cpu-int-v5-0-f98c5a244636@rev.ng/
> 
> v1: https://patchew.org/QEMU/20260823150731.896-1-luoyonggang@gmail.com/
> v2: https://patchew.org/QEMU/20260826184229.1145-1-luoyonggang@gmail.com/
> branch: https://gitlab.com/lygstate-qemu/qemu/-/tree/single-binary-arm-riscv?ref_type=heads
> x86_64 and i386: https://gitlab.com/lygstate-qemu/qemu/-/tree/combined-binary-multi-targets?ref_type=heads
>
thanks to pursue this effort.
It seems like your mail provider blocked the send after 40 patches. It
can either be:
- usually I have to reenter my password (after a timeout around 3 to 4
min) to keep on sending patches. A better way is to setup your password
in git config.
- Your reached your daily quota because there are two many cc on each
patch. Reduce cc list.

Also, I would recommend you start easy, with only two base arch as
targets (like aarch64 + riscv64). This makes the series much nicer to
review and iterate. Then you can do one series per extra target.
It takes time, but that's the only sane way to move forward.

Also, I would invite you to get the command line details reviewed first,
as it was the biggest point of discussion last time I tried this. Once
you reach a consensus, it will be trivial to add new targets in.
I'll follow any choice the community will make for this.

Regards,
Pierrick

